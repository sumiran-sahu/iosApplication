//
//  TimeCollectionViewCell.swift
//  weatherapp
//
//  Created by com on 02/09/23.
//

import UIKit

open class TimeCollectionViewCell: UICollectionViewCell {

//    static let identifier                                   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    open override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    static func nib()-> UINib{
        return UINib(nibName: "TimeCollectionViewCell", bundle: nil)
    }
//   
}


