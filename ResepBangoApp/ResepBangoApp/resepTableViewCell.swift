//
//  resepTableViewCell.swift
//  ResepBangoApp
//
//  Created by Haidar Rais on 11/17/17.
//  Copyright © 2017 Haidar Rais. All rights reserved.
//

import UIKit

class resepTableViewCell: UITableViewCell {
    @IBOutlet weak var labelresep: UILabel!
    @IBOutlet weak var labelporsi: UILabel!
    @IBOutlet weak var labellama: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
