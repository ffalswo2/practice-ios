//
//  InstanceViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class InstanceViewController: UIViewController {

    @IBOutlet weak var instanceLabel: UILabel!
    
    var firstVC: FirstViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendDataToFirstVC(_ sender: Any) {
        
        firstVC?.instanceCheckLabel.text = "check Instance confirmed!"
        self.dismiss(animated: true)
    }
    

}
