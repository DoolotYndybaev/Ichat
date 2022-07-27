//
//  UserCellTableViewCell.swift
//  Ichat
//
//  Created by Doolot on 27/7/22.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    static let reuseId = "UserCellTableViewCell"
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(_ name: String){
        userName.text = name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
