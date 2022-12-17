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
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        viewModel?.viewDidLoad()
    
    }
    
    private func registerCells(){
        let fixtureCellName = String(describing: FixtureCell.self)
        let fixtureCellNib = UINib(nibName: fixtureCellName, bundle: .main)
        tableView.register(fixtureCellNib, forCellReuseIdentifier: fixtureCellName)
    }
}

extension LiveVC: LiveViewModelDelegate {
    func handle(output: LiveViewModelOutput) {
        switch output {
        case .fetchedLive:
            tableView.reloadData()
        }
    }
}
extension LiveVC: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let fixtureResponseCount = viewModel?.fixtureSection.count
        else { return 0 }
        return fixtureResponseCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fixtureItemCount = viewModel?.fixtureSection[section].fixtureItem.count
        else { return 0 }
        return fixtureItemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let fixtureItem = viewModel?.fixtureSection[indexPath.section].fixtureItem[indexPath.row]
        else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FixtureCell.self)) as? FixtureCell {
            cell.config(with: fixtureItem)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let leagueName = viewModel?.fixtureSection[section].leagueName
        else { return "" }
        return leagueName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedFixture = viewModel?.fixtureSection[indexPath.section].fixtureItem[indexPath.row]
        else { return }
        
        let fixtureDetailNibName = String(describing: FixtureDetailVC.self)
        let fixtureDetailVM = FixtureDetailViewModel()
        
        let fixtureDetailVC = FixtureDetailVC(nibName: fixtureDetailNibName, bundle: .main)
        fixtureDetailVM.fixture = selectedFixture
        fixtureDetailVC.viewModel = fixtureDetailVM
        
        UIApplication.topViewController()?.navigationController?.pushViewController(fixtureDetailVC, animated: true)
    }
}

extension LiveVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25
    }
}
