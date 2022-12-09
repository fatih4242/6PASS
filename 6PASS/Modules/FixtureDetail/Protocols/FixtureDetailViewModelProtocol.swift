//
//  FixtureDetailViewModelProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 9.12.2022.
//

import Foundation

protocol FixtureDetailViewModelProtocol {
    var fixture: FixtureSubResponseModel? { get set }
    var delegate: FixtureDetailDelegate? { get set }
    
    func viewDidLoad()
}

enum FixtureDetailViewModelOutput {
    case fetchedFixture
}

protocol FixtureDetailDelegate {
    func handle(_ output: FixtureDetailViewModelOutput)
}
