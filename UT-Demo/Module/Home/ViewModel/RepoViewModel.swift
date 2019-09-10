//
//  UserViewModel.swift
//  UT-Demo
//
//  Created by maithigiang on 8/4/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import UIKit
import Alamofire

class RepoViewModel: NSObject {
    var repos = Dynamic<[Repo?]>([])
    var error = Dynamic<ResponseObject?>(ResponseObject())
    var beginFetchData = true
    var pagnigation = Pagination()
    var perPage = 10
    var urlRequest: URLRequestConvertible?
    
    func getRepos(completion: @escaping ResponseHandler) {
        var params = Parameters()
        params["q"] = "language:swift"
        params["page"] = pagnigation.currentPage + 1
        params["per_page"] = perPage
        urlRequest = RepoRouter.getRepos(parameters: params)
        _ = ApiClient.request(urlRequest: RepoRouter.getRepos(parameters: params)) { [weak self] (response) in
            guard let strongSelf = self else { return }
            if response?.result == .success {
                let repoArr = Repo.fromDatas(jsonObject: response?.data)
                strongSelf.repos.value.append(contentsOf: repoArr)
                
                // update current Page, total Page
                strongSelf.pagnigation
                    .updateCurrentPage(strongSelf.repos.value.count)
                strongSelf.pagnigation.getTotalPage(jsonObject: response?.data)
                completion(response)
                
            } else {
                if response?.statusCode == HttpStatusCode.validationFail {
                    var data: [String: AnyObject] = [:]
                    data["id"] = 1 as AnyObject
                    data["full_name"] = "lala" as AnyObject
                    strongSelf.repos
                        .value.append(Repo.init(jsonObject: data))
                    completion(response)
                } else {
                    strongSelf.error.value = response
                    completion(response)
                }
            }
            
        }
        
    }
    

}
