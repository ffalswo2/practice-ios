//
//  DelegateViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

protocol DelegateViewControllerDelegate: AnyObject {
    func passString(string: String)
}


class DelegateViewController: UIViewController {
    
    
    weak var delegate: DelegateViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func passDataToFirstVC(_ sender: Any) {
        
        delegate?.passString(string: "delegate 다시 공부중")
        self.dismiss(animated: true)
    }
}
