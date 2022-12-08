//
//  SixPassApi.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import Foundation

protocol SixPassFetchable {
    func liveList(request: LiveRequestModel, completion: @escaping (Result<LiveResponseModel, ApiError>) -> ())
    func fixtureList(request: FixtureRequestModel, completion: @escaping (Result<FixtureBaseResponseModel, ApiError>) -> ())
}

final class SixPassApi: SixPassFetchable {
 
    private let networkManager: Networking
    
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    func liveList(request: LiveRequestModel, completion: @escaping (Result<LiveResponseModel, ApiError>) -> ()) {
        networkManager.request(request: request, completion: completion)
    }
    func fixtureList(request: FixtureRequestModel, completion: @escaping (Result<FixtureBaseResponseModel, ApiError>) -> ()) {
        networkManager.request(request: request, completion: completion)
    }
}
