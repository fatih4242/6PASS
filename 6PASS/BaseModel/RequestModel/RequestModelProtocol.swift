//
//  RequestModelProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation
protocol RequestModelProtocol {
    var baseURL: String? { get }
    var paths : [String]? { get }
    var parameters : [String : Any]? { get }
    var headers : [String : String]? { get }
    var method : RequestMethod? { get }
    var body : [String : Any]? { get }
    
    func generateRequest() -> URLRequest?
    mutating func prepareRequest()
}

extension RequestModelProtocol {
    var baseURL: String? {
        return SixPassApiConstant.baseURL.rawValue
    }
    var method: RequestMethod? {
        return .get
    }
    var body: [String : Any]? {
        return nil
    }
    var parameters: [String: Any]? {
        return nil
    }
    var headers: [String : String]? {
        [
            "x-rapidapi-host" : "v3.football.api-sports.io",
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba"
        ]
    }
    
    mutating func prepareRequest() { }
}
