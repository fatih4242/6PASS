//
//  LiveDataProvider.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
final class LiveDataProvider: LiveDataProviderProtocol {
  
    private let sixPassApi: SixPassFetchable
    
    init(sixPassApi: SixPassApi) {
        self.sixPassApi = sixPassApi
    }
    
    func liveList(request: LiveRequestModel, completion: @escaping (Result<LiveResponseModel, ApiError>) -> ()){
        sixPassApi.liveList(request: request, completion: completion)
    }
    func fixtureList(request: FixtureRequestModel, completion: @escaping (Result<FixtureBaseResponseModel, ApiError>) -> ()) {
        sixPassApi.fixtureList(request: request, completion: completion)

    }
}
