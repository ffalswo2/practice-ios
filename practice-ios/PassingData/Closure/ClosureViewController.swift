//
//  ClosureViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class ClosureViewController: UIViewController {

    
    var closure: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func passDataFirstWithClosure(_ sender: Any) {
        
        closure?("closure string")
        self.dismiss(animated: true)
    }
}
