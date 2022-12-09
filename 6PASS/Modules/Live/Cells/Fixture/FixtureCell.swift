//
//  FixtureCell.swift
//  6PASS
//
//  Created by Fatih Toker on 8.12.2022.
//

import UIKit

class FixtureCell: UITableViewCell {

    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    
    func config(with model: FixtureSubResponseModel) {
        elapsedTimeLabel.text = String(model.fixture?.status?.elapsed ?? 0) + "'"
        homeTeamNameLabel.text = model.teams?.home?.name ?? ""
        scoreLabel.text = "\(model.goals?.home ?? 0) - \(model.goals?.away ?? 0)"
        awayTeamNameLabel.text = model.teams?.away?.name ?? ""
    }
}
