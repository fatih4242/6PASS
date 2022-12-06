//
//  LiveRequestModel.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation
struct LiveRequestModel : RequestModelProtocol{
    var baseURL: String = ""
    var paths: [String] = []
    var parameters: [String : Any] = [:]
    var headers: [String : String] = [:]
    var method: RequestMethod = .get
    var body: [String : Any] = [:]
    
    init(paths: [String]) {
        self.paths = paths
        prepareRequest()
    }
    
    mutating func prepareRequest() {
        self.baseURL = SixPassApiConstant.baseURL.rawValue
    }
}
