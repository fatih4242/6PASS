//
//  FixtureDetailViewModel.swift
//  6PASS
//
//  Created by Fatih Toker on 9.12.2022.
//

import Foundation

final class FixtureDetailViewModel: FixtureDetailViewModelProtocol {
    var fixture: FixtureSubResponseModel?
    var delegate: FixtureDetailDelegate?
    
    func viewDidLoad() {
        notify(output: .fetchedFixture)
    }
    
    private func notify(output: FixtureDetailViewModelOutput) {
        delegate?.handle(output)
    }
}


