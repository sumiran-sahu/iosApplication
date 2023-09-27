//
//  SecondPage.swift
//  weatherapp
//
//  Created by com on 01/09/23.
//

import UIKit
struct weatherData{
    let dayOfWeek: String
    var weatherCondition: String
}
open class SecondPage: UIViewController {
    var weatherDataArray: [weatherData] = []
    
    @IBOutlet public var weatherTableView: UITableView?
    @IBOutlet public var imagetemp: UIImageView?
    open override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView?.delegate = self
        weatherTableView?.dataSource = self
        imagetemp?.image = UIImage .init(named:"imagetemp")
        generateWeatherData()
 
    }

}
extension SecondPage{
    public func generateWeatherData() {
//        var daysOfWeek : [String] = []
        let daysOfWeek = ["Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" , "Saturday", "Sunday"]
//  var weatherCondition: [String] = []
     var weatherCondition = ["Cloudy" ,"Sunny" , "Windy" , "Foggy" , "Sunny" ,"Rainy", "Windy"]
        if weatherCondition.isEmpty || daysOfWeek.isEmpty{
            showAlert(message: "Server Down No Weather Data Available")
            return
        }
        while weatherCondition.count < daysOfWeek.count{
            weatherCondition = weatherCondition + weatherCondition
           
        }
        
        for (index , day) in daysOfWeek.enumerated() {
       
            let conditionIndex = index % weatherCondition.count
            let randomCondition = weatherCondition[conditionIndex]
            let weatherData = weatherData(dayOfWeek: day, weatherCondition: randomCondition)
            weatherDataArray.append(weatherData)
        }
    }
}

extension SecondPage{
    public func showAlert(message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        
        present(alertController,animated: true,completion: nil)
    }
    
   
}

extension SecondPage: UITableViewDelegate , UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherDataArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:indexPath) as? TableViewCell
        let weatherItem = weatherDataArray[indexPath.row]
        if weatherItem.dayOfWeek.isEmpty{
            cell?.lblName?.text = "-"
        }else{
            cell?.lblName?.text = weatherItem.dayOfWeek
        }
 
        if weatherItem.weatherCondition.isEmpty {
            cell?.lblSecond?.text = "-"
        }else{
            cell?.lblSecond?.text = weatherItem.weatherCondition
        }
        return cell ?? UITableViewCell()
    }
    
    
}

