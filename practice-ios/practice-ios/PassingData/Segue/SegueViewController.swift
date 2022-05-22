//
//  SegueViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var string = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = string
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
