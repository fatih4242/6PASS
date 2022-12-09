//
//  LiveViewModelProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
protocol LiveViewModelProtocol{
    var delegate: LiveViewModelDelegate? { get set }
    var fixtureSection: [FixtureSectionModel] { get set }
    
    func viewDidLoad()
    func fetchLiveList()
    func fetchFixtureList(id: Int, completion: @escaping (([FixtureSubResponseModel]) -> ()))
}

enum LiveViewModelOutput{
    case fetchedLive
}

protocol LiveViewModelDelegate: AnyObject{
    func handle(output: LiveViewModelOutput)
}
