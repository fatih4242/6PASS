//
//  FixtureBaseResponseModel.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
struct FixtureBaseResponseModel: Codable {
    let response: [FixtureSubResponseModel]?
}

struct FixtureSubResponseModel: Codable{
    let fixture: FixtureDetailResponseModel?
    let league: FixtureLeagueResponseModel?
    let teams: FixtureTeamsResponseModel?
}

//MARK: Fixture
struct FixtureDetailResponseModel: Codable{
    let id: Int?
    let referee: String?
    let venue: FixtureVenueResponseModel?
    let status: FixtureStatusResponseModel?
    let goals: FixtureGoalsResponseModel?
}
struct FixtureVenueResponseModel: Codable{
    let id: Int?
    let name: String?
    let city: String?
}

struct FixtureStatusResponseModel: Codable{
    let elapsed: Int?
}
// MARK: League
struct FixtureLeagueResponseModel: Codable{
    let id: Int?
    let name: String?
    let logo: String?
    let season: Int?
}
//MARK: Teams
struct FixtureTeamsResponseModel: Codable{
    let home: FixtureTeamsHomeResponseModel?
    let away: FixtureTeamsAwayResponseModel?
}
struct FixtureTeamsHomeResponseModel: Codable{
    let id: Int?
    let name: String?
    let logo: String?
    let winner: Bool?
}
struct FixtureTeamsAwayResponseModel: Codable{
    let id: Int?
    let name: String?
    let logo: String?
    let winner: Bool?
}
//MARK: Goals
struct FixtureGoalsResponseModel: Codable{
    let home: Int?
    let away: Int?
}

//TODO: Devamı Var
