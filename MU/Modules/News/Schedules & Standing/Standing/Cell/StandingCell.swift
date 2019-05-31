//
//  StandingCell.swift
//  MU
//
//  Created by NDS on 30/05/19.
//  Copyright © 2019 NDS. All rights reserved.
//

import UIKit

class StandingCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var gamePlayeLabel: UILabel!
    @IBOutlet weak var winTotalLabel: UILabel!
    @IBOutlet weak var drawTotalLabel: UILabel!
    @IBOutlet weak var loseTotalLabel: UILabel!
    @IBOutlet weak var goalDiffLabel: UILabel!
    @IBOutlet weak var pointTotalLabel: UILabel!
    @IBOutlet weak var lineSeparatorView: UIView!
    
    var position: Int = 0
    var standingData: Table?
    
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
    
    func updateUI() {
        guard
            let team = standingData?.name,
            let gamePlay = standingData?.played,
            let winTotal = standingData?.win,
            let drawTotal = standingData?.draw,
            let loseTotal = standingData?.loss,
            let goalDiff = standingData?.goalsdifference,
            let pointTotal = standingData?.total
            else {
                return
        }
        position += 1
        positionLabel.text = "\(position)"
        teamLabel.text = team
        gamePlayeLabel.text = "\(gamePlay)"
        winTotalLabel.text = "\(winTotal)"
        drawTotalLabel.text = "\(drawTotal)"
        loseTotalLabel.text = "\(loseTotal)"
        goalDiffLabel.text = "\(goalDiff)"
        pointTotalLabel.text = "\(pointTotal)"
        
        if team == "Man United" {
            teamLabel.textColor = ColorConstants.primaryRed
        }
        
        let posZonaChampion = 4
        let posZonaDegradasi = 17
        
        if position == posZonaChampion || position == posZonaDegradasi {
            lineSeparatorView.backgroundColor = ColorConstants.primaryRed
        }
    }
}
