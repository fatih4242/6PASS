//
//  FixtureRequestModel.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
struct FixtureRequestModel: RequestModelProtocol{

    var paths: [String] = []
    var parameters: [String : Any] = [:]
    
    private var id: Int
    
    init(paths: [String], id: Int) {
        self.paths = paths
        self.id = id
        prepareRequest()
    }
    
    mutating func prepareRequest() {
        self.parameters = [
            "id": id
        ]
    }
}
