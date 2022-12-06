import Foundation

struct LiveResponseModel: Codable {
    let response: [ResponseModel]?
}

struct ResponseModel: Codable {
    let fixture: FixtureResponseModel?
    let league: LeagueResponse?
}

struct FixtureResponseModel: Codable {
    let id: Int?
    let status: StatusResponse?
}

struct StatusResponse: Codable {
    let long: String?
    let elapsed: Int?
}

struct LeagueResponse: Codable {
    let id: Int?
    let season: Int?
}
