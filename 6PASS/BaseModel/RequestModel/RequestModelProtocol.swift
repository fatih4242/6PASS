//
//  RequestModelProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation
protocol RequestModelProtocol {
    var baseURL: String { get set }
    var paths : [String] { get set }
    var parameters : [String : Any] { get set }
    var headers : [String : String] { get set }
    var method : RequestMethod { get set }
    var body : [String : Any] { get set }
    
    func generateRequest() -> URLRequest?
    mutating func prepareRequest()
}

extension RequestModelProtocol {

    var baseURL: String {
        get { return SixPassApiConstant.baseURL.rawValue }
        set { }
    }
    var method: RequestMethod {
        get { .get}
        set { }
    }
    var body: [String : Any] {
        get { [:] }
        set { }
    }
    var headers: [String : String] {
        get {
            [
                "x-rapidapi-host" : "v3.football.api-sports.io",
                "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba"
            ]
        } set { }
    }
}
