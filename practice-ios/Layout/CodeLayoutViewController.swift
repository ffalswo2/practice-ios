//
//  CodeLayoutViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/23.
//

import UIKit

class CodeLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    
    func setUI() {
        let myButton = UIButton.init(type: .system)
        myButton.setTitle("코드로 만든 버튼", for: .normal)
        self.view.addSubview(myButton)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let myLabel = UILabel.init()
        myLabel.text = "코드로 만든 라벨"
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myLabel)
        myLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        myLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
    }

    

}
