//
//  StudentTableViewCell.swift
//  workEight
//
//  Created by jiang on 2018/11/12.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImge: UIImageView!
    @IBOutlet weak var studentFirstName: UILabel!
    @IBOutlet weak var studentId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
