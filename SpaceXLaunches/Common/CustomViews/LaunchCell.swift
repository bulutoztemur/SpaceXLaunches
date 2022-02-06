//
//  LaunchCell.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    var launch: LaunchListQuery.Data.Launch? {
        didSet {
            missionNameLabel.text = launch?.missionName
        }
    }
    
    @IBOutlet weak var missionPatchImageView: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var siteNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
