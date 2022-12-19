//
//  FixtureDetailVC.swift
//  6PASS
//
//  Created by Fatih Toker on 9.12.2022.
//

import UIKit

class FixtureDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FixtureDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerCells()
        viewModel?.viewDidLoad()
    }
    
    private func registerCells() {
        let scoreCellName = String(describing: ScoreCell.self)
        let scoreCellNib = UINib(nibName: scoreCellName, bundle: .main)
        tableView.register(scoreCellNib, forCellReuseIdentifier: scoreCellName)
        
        let tabCellName = String(describing: TabViewCell.self)
        let tabCellNib = UINib(nibName: tabCellName, bundle: .main)
        tableView.register(tabCellNib, forCellReuseIdentifier: tabCellName)
    }
}

extension FixtureDetailVC: FixtureDetailDelegate {
    func handle(_ output: FixtureDetailViewModelOutput) {
        switch output {
        case .fetchedFixture:
            self.tableView.reloadData()
        }
    }
}

extension FixtureDetailVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemCount = viewModel?.tableItems.count
        else { return 0 }
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel?.tableItems[indexPath.row],
              let fixture = viewModel?.fixture
        else { return UITableViewCell() }
        
        switch item {
        case .score:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ScoreCell.self)) as? ScoreCell{
                cell.config(with: fixture)
                return cell
            }
        case .tabView:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TabViewCell.self)) as? TabViewCell {
                cell.fixtureSubResponse = viewModel?.fixture
                return cell
            }
        }
        return UITableViewCell()
    }
}


