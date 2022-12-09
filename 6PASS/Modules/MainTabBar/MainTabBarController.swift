//
//  MainTabBarController.swift
//  6PASS
//
//  Created by Fatih Toker on 8.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let networking = NetworkManager(session: .shared)
        let sixPassApi = SixPassApi(networkManager: networking)
        let liveDataProivder = LiveDataProvider(sixPassApi: sixPassApi)
        let liveViewModel = LiveViewModel(dataProvider: liveDataProivder)
        let liveVC = LiveVC(nibName: String(describing: LiveVC.self), bundle: .main)
        liveVC.viewModel = liveViewModel
        liveVC.tabBarItem.title = "Live's"
        liveVC.tabBarItem.image = .lives
        self.viewControllers = [liveVC]
    }

}
