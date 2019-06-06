//
//  SchedulesCell.swift
//  MU
//
//  Created by NDS on 01/06/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class SchedulesCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var dateMatchLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var scoreOrTimeLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    
    var dataSchedules: Events?
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        scoreOrTimeLabel.text = nil
    }
    
    func updateUI() {
        guard
            let eventDate = dataSchedules?.dateEvent,
            let homeTeam = dataSchedules?.strHomeTeam,
            let awayTeam = dataSchedules?.strAwayTeam,
            let homeTeamScore = dataSchedules?.intHomeScore,
            let awayTeamScore = dataSchedules?.intAwayScore,
            let timeMatch = dataSchedules?.strTime,
            let league = dataSchedules?.strLeague
        else { fatalError() }
        
        dateMatchLabel.text = "\(eventDate.indoDateFormat()) - \(league)"
        homeTeamLabel.text = "\(homeTeam)"
        awayTeamLabel.text = "\(awayTeam)"
        
        if homeTeamScore != "" && awayTeamScore != "" {
            scoreOrTimeLabel.text = "\(homeTeamScore) - \(awayTeamScore)"
        } else {
            scoreOrTimeLabel.text = timeMatch[0..<5]
        }
        
    }
    
}
