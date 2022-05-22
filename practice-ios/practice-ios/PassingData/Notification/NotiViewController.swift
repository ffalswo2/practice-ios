//
//  NotiViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class NotiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func notiAction(_ sender: Any) {
        
        let notificationName = Notification.Name("sendData")
        
        let strDict = ["str" : "Minjae go get it!"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDict)
        
        self.dismiss(animated: true)
    }
    
    

}
