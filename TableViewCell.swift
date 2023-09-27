//
//  TableViewCell.swift
//  weatherapp
//
//  Created by com on 01/09/23.
//

import UIKit

open class TableViewCell: UITableViewCell {

    @IBOutlet public var lblName: UILabel?
    @IBOutlet public var lblSecond: UILabel?
    open override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
