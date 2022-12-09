//
//  FixtureDetailVC.swift
//  6PASS
//
//  Created by Fatih Toker on 9.12.2022.
//

import UIKit

class FixtureDetailVC: UIViewController {
    
    //@IBOutlet weak var fixtureLabel: UILabel!
    var viewModel: FixtureDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    

    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayLogoImage: UIImageView!
    @IBOutlet weak var homeLogoImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var homeImg : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fixtureLabel.text = fixture?.teams?.home?.name ?? ""
        
        viewModel?.viewDidLoad()
    }

    private func setupUI() {
        guard let homeLogo = viewModel?.fixture?.teams?.home?.logo,
              let awayLogo = viewModel?.fixture?.teams?.away?.logo,
              let homeName = viewModel?.fixture?.teams?.home?.name,
              let awayName = viewModel?.fixture?.teams?.away?.name,
              let homeGoals = viewModel?.fixture?.goals?.home,
              let awayGoals = viewModel?.fixture?.goals?.away
        else { return }

        
        awayLogoImage.download(from: awayLogo)
        homeLogoImage.download(from: homeLogo)
        
        homeTeamNameLabel.text = homeName
        awayTeamNameLabel.text = awayName
        scoreLabel.text = "\(homeGoals) - \(awayGoals)"
    }
}
extension FixtureDetailVC: FixtureDetailDelegate {
    func handle(_ output: FixtureDetailViewModelOutput) {
        switch output {
        case .fetchedFixture:
            setupUI()
        }
    }
}
