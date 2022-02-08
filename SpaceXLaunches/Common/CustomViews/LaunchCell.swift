//
//  LaunchCell.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit
import SDWebImage

class LaunchCell: UITableViewCell {
    
    var launch: LaunchListQuery.Data.Launch? {
        didSet {
            let placeholder = UIImage(named: "SpaceX")
            if let missionPatch = launch?.links?.missionPatchSmall {
                self.missionPatchImageView.sd_setImage(with: URL(string: missionPatch)!, placeholderImage: placeholder)
                self.missionPatchImageView.backgroundColor = .clear
            } else {
                self.missionPatchImageView.image = placeholder
                self.missionPatchImageView.backgroundColor = .white
            }
            missionNameLabel.text = launch?.missionName
            rocketNameLabel.text = launch?.rocket?.rocketName
            siteNameLabel.text = launch?.launchSite?.siteNameLong
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
