//
//  LiveViewModel.swift
//  6PASS
//
//  Created by Fatih Toker on 6.12.2022.
//

import Foundation
final class LiveViewModel: LiveViewModelProtocol{

    var delegate: LiveViewModelDelegate?
    private let dataProvider : LiveDataProviderProtocol?
    var fixtureResponse: [FixtureSubResponseModel] = []
    
    var leagueResponse: [ResponseModel] = []
    

    
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
                    self.fetchFixtureList(id: item.fixture?.id ?? 0) { response in
                        print(response)//
                    }
                }
                case .failure(let error):
                    print("err: \(error.description)")
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
