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
    let goals: FixtureGoalsResponseModel?
    let events: [FixtureEventsResponseModel]?
}

//MARK: Fixture
struct FixtureDetailResponseModel: Codable{
    let id: Int?
    let referee: String?
    let venue: FixtureVenueResponseModel?
    let status: FixtureStatusResponseModel?
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
struct FixtureEventsResponseModel: Codable{
    let time: FixtureEventsTimeResponseModel?
    let team: FixtureEventsTeamResponseModel?
    let player: FixtureEventsPlayerResponseModel?
    let assist: FixtureEventsAssistResponseModel?
    let type: String?
    let detail: String?
    let comments: String?
}

struct FixtureEventsTimeResponseModel: Codable{
    let elapsed: Int?
    let extra: Int?//Int
}
struct FixtureEventsTeamResponseModel: Codable{
    let id: Int?
    let name: String?
    let logo: String?
}
struct FixtureEventsPlayerResponseModel: Codable{
    let id: Int?
    let name: String?
}
struct FixtureEventsAssistResponseModel: Codable{
    let id: Int?
    let name: String?
}

//TODO: Devamı Var
