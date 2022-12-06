//
//  LiveVC.swift
//  6PASS
//
//  Created by Fatih Toker on 5.12.2022.
//

import UIKit

class LiveVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: LiveViewModelProtocol? {
        //didSet ViewModel'e Dışardan atama aktarma yapıldığı zaman tetiklenir
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension LiveVC: LiveViewModelDelegate {
    
    func handle(output: LiveViewModelOutput) {
        switch output {
        case .fetchedLive:
            break
        }
    }
}
