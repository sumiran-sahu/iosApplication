//
//  ViewController.swift
//  weatherapp
//
//  Created by com on 31/08/23.
//

import UIKit

open class ViewController: UIViewController {
    
    @IBOutlet public var tomLbl: UILabel?
    @IBOutlet public var yestLbl: UILabel?
    @IBOutlet public var backImage: UIImageView?
    @IBOutlet public var topLbl: UILabel?
    @IBOutlet public var tempImage: UIImageView?
    open override func viewDidLoad() {
        super.viewDidLoad()
        tomLbl?.text = "Tomorrow- Cloudy"
        yestLbl?.text = "Today- Windy"
        topLbl?.text = "Bhubaneswar , Odisha"
        tempImage?.image = UIImage .init(named:"tempimage")
        backImage?.image = UIImage .init(named:"backimage")
        let tomTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        tomLbl?.isUserInteractionEnabled = true
        tomLbl?.addGestureRecognizer(tomTapGesture)
        let yestTapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTappedUp))
        yestLbl?.isUserInteractionEnabled = true
        yestLbl?.addGestureRecognizer(yestTapGesture)
    }
    @IBAction func lastBtnAction(_ sender: UIButton) {
        //                let story = UIStoryboard(name: "Main", bundle: nil)
        //                guard let vc1 = story.instantiateViewController(withIdentifier: "SecondPage") as? SecondPage else{
        //                    print("view controller not found")
        //                    return
        //                }
        //                navigationController?.pushViewController(vc1, animated: true)
        //            }
        guard let secondPageDestination = storyboard?.instantiateViewController(withIdentifier: "SecondPage") as? SecondPage  else {
            return
            
        }
        navigationController?.pushViewController(secondPageDestination, animated: true)
    }
    @objc open func labelTapped() {
        guard let thirdPageDestination = storyboard?.instantiateViewController(withIdentifier: "ThirdPage") as? ThirdPage  else {
            return
        }
        navigationController?.pushViewController(thirdPageDestination, animated: true)
    }
    @objc open func labelTappedUp() {
        guard let forthPageDestination = storyboard?.instantiateViewController(withIdentifier: "ForthPage") as? ForthPage  else {
            return
        }
        navigationController?.pushViewController(forthPageDestination, animated: true)
    }
    
}
