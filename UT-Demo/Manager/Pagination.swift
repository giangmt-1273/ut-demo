//
//  Pagination.swift
//  UT-Demo
//
//  Created by le.huu.dung on 9/4/19.
//  Copyright © 2019 maithigiang. All rights reserved.
//

import Foundation

class Pagination{
    var totalPage: Int
    var currentPage: Int
    var isLoadMore: Bool {
        return currentPage < totalPage
    }
    
    init() {
        self.totalPage = 0
        self.currentPage = 0
    }
    
    init(totalPage: Int, currentPage: Int) {
        self.totalPage = totalPage
        self.currentPage = currentPage
    }
    
    func updateCurrentPage(_ items: Int?) {
        self.currentPage = getPage(total: items)
    }
    
    func getTotalPage(jsonObject: Any?) {
        guard let jsonDict = jsonObject as? Dictionary<String, Any>,
        let totalItem = jsonDict["total_count"] as? Int else {
            return
        }
        self.totalPage = getPage(total: totalItem)
    }
    
    func getPage(total: Int?) -> Int {
        guard let total = total else { return 0 }
        if total % Constant.perPage == 0 {
            return total/Constant.perPage
        }
        return Int(total / Constant.perPage) + 1
    }
}
