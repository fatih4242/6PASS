//
//  LiveRequestModel.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation
struct LiveRequestModel : RequestModelProtocol {
    var paths: [String]?
    
    init(paths: [String]) {
        self.paths = paths
    }
}
