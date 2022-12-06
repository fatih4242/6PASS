//
//  LiveDataProviderProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
protocol LiveDataProviderProtocol{
    func liveList(request: LiveRequestModel, completion: @escaping (Result<LiveResponseModel, ApiError>) -> ())
    func fixtureList(request: FixtureRequestModel, completion: @escaping (Result<FixtureResponseModel, ApiError>) -> ())
}

