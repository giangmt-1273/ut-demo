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
    var repos = Dynamic<[Repo]>([])
    
    func getRepos() {
        var params = Parameters()
        params["q"] = "language:swift"
        params["page"] = 1
        params["per_page"] = 10
        _ = ApiClient.request(urlRequest: RepoRouter.getRepos(parameters: params)) { [weak self] (response) in
            guard let strongSelf = self else { return }
            if response?.result == .success {
                strongSelf.repos.value = Repo.fromDatas(jsonObject: response?.data)
            } else {
                strongSelf.repos.value = []
            }
        }
    }
}
