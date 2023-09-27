//
//  ThirdPage.swift
//  weatherapp
//
//  Created by com on 02/09/23.
//

import UIKit
struct timeData{
    let time:String
    let imageName:String
}
open class ThirdPage: UIViewController {
    var timeDataArray :[timeData] = []
    
    @IBOutlet public var timeReport: UILabel!
    @IBOutlet public var collectionView: UICollectionView!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(TimeCollectionViewCell.nib(),forCellWithReuseIdentifier: "TimeCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        timeDataArray = generateSampleTimeData()
        timeReport?.text = "Time Report"

    }

}
extension ThirdPage{
     func generateSampleTimeData() -> [timeData]{
        let image = ["Cloudy", "Cloudy" , "Sunny"]
        var timeDataArray:[timeData] = []
        var hour = 8
        for _ in 1...3 {
            let randomImageIndex = Int.random(in: 0..<image.count)
            let randomImgName = image[randomImageIndex]
            let time = "\(hour) : 00"
            timeDataArray.append(timeData(time:time , imageName: randomImgName))
            hour = hour + 8
        }
         return timeDataArray
    }
    
}
extension ThirdPage : UICollectionViewDelegate , UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCell", for: indexPath) as? TimeCollectionViewCell
        let timeItem = timeDataArray[indexPath.item]
        cell?.timeLabel?.text = timeItem.time
        cell?.imageView?.image = UIImage(named: timeItem.imageName)
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
