//
//  LiveViewModel.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
final class LiveViewModel: LiveViewModelProtocol{
    
    var fixtureSection: [FixtureSectionModel] = []
    private let dataProvider : LiveDataProviderProtocol?
    private var fixtureResponseCollect: [FixtureSubResponseModel] = []
    let group = DispatchGroup()
    var delegate: LiveViewModelDelegate?
    
    init(dataProvider: LiveDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchLiveList()
    }
    
    func fetchLiveList() {
        dataProvider?.liveList(request: .init(paths: [SixPassApiConstant.live.rawValue]), completion: { result in
            switch result {
                case .success(let response):
                guard let response = response.response
                else { return }
                
                response.forEach { item in
                    self.group.enter()
                    self.fetchFixtureList(id: item.fixture?.id ?? 0) { fixtureResponse in
                        
                        self.fixtureResponseCollect.append(contentsOf: fixtureResponse)
                        self.group.leave()
                    }
                }
                self.group.notify(queue: .main) {
                    self.fixtureResponseCollect = self.fixtureResponseCollect.sorted(by: { $0.league?.id ?? 0 > $1.league?.id ?? 0 })
                    let fixtureDictionary = Dictionary(grouping: self.fixtureResponseCollect, by: { $0.league?.name ?? "" })
                    fixtureDictionary.forEach { item in
                        let fixtureSectionModel = FixtureSectionModel(leagueName: item.key, fixtureItem: item.value)
                        self.fixtureSection.append(fixtureSectionModel)
                    }
                    self.notify(.fetchedLive)
                    
                }
                case .failure(let error):
                print("err: \(error)")
            }
        })
    }
    func fetchFixtureList(id: Int, completion: @escaping (([FixtureSubResponseModel]) -> ())) {
        dataProvider?.fixtureList(request: .init(paths: [SixPassApiConstant.fixture.rawValue], id: id), completion: { result in
            switch result {
            case .success(let response):
                guard let response = response.response
                else { return }
                completion(response)
                
            case .failure(let failure):
                print("err: \(failure)")
            }
        })
   }
                                  
    private func notify(_ output: LiveViewModelOutput) {
        delegate?.handle(output: output)
    }
    
    
}
