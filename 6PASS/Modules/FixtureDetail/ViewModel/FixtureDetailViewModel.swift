//
//  FixtureDetailViewModel.swift
//  6PASS
//
//  Created by Fatih Toker on 9.12.2022.
//

import Foundation

final class FixtureDetailViewModel: FixtureDetailViewModelProtocol {
    var tableItems: [FixtureDetailCellType] = []
    var fixture: FixtureSubResponseModel?
    var delegate: FixtureDetailDelegate?
    
    func viewDidLoad() {
        tableItems.append(.score)
        notify(output: .fetchedFixture)
    }
    
    private func notify(output: FixtureDetailViewModelOutput) {
        delegate?.handle(output)
    }
}


