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
//                self.fetchFixtureList(id: response.first?.fixture?.id ?? 0)
//                response.forEach { item in
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                        self.fetchFixtureList(id: item.fixture?.id ?? 0)
//                    }
//                }
            case .failure(let error):
                print("err: \(error.description)")
            }
        })
    }
    func fetchFixtureList(id: Int) {
        dataProvider?.fixtureList(request: .init(paths: [SixPassApiConstant.live.rawValue], id: id), completion: { result in
            switch result {
            case .success(let response):
                print("foo: \(response)")
            case .failure(let failure):
            print("err: \(failure)")
            }
        })
   }
                                  
    private func notify(_ output: LiveViewModelOutput) {
        delegate?.handle(output: output)
    }
}
