//
//  SecondViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var checkLabel: UILabel!
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        // Do any additional setup after loading the view.
    }
    
    
    func setText() {
        checkLabel.text = someString
    }
    

}
