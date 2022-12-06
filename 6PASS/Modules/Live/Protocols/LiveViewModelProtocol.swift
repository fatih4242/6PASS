//
//  LiveViewModelProtocol.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
protocol LiveViewModelProtocol{
    var delegate: LiveViewModelDelegate? { get set }
    
    func viewDidLoad()
    func fetchLiveList()
    func fetchFixtureList(id: Int)
}

enum LiveViewModelOutput{
    case fetchedLive
}

protocol LiveViewModelDelegate: AnyObject{
    func handle(output: LiveViewModelOutput)
}
