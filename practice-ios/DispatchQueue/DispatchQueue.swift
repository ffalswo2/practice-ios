//
//  DispatchQueue.swift
//  practice-ios
//
//  Created by 김민재 on 2022/06/21.
//

import UIKit

class DispatchQueue: UIViewController {

    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimeLabel()
    }
    
    @IBAction func firstBtnDidTap(_ sender: UIButton) {
        simpleClosure {
            Dispatch.DispatchQueue.main.async {
                self.finishLabel.text = "끝"
            }
            
        }
    }
    
    @IBAction func secondBtnDidTap(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        
        // 서로 다른 작업자 3명
        let queue1 = Dispatch.DispatchQueue(label: "Q1")
        let queue2 = Dispatch.DispatchQueue(label: "Q2")
        let queue3 = Dispatch.DispatchQueue(label: "Q3")
        
        queue1.async(group: dispatchGroup, qos: .background) {
            for i in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
//            dispatchGroup.enter()
//            Dispatch.DispatchQueue.global().async {
//                for i in 0..<10 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(i)
//                }
//                dispatchGroup.leave()
//            }
            
        }
        
        queue2.async(group: dispatchGroup, qos: .userInteractive) {
            for i in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
//            dispatchGroup.enter()
//            Dispatch.DispatchQueue.global().async {
//                for i in 10..<20 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(i)
//                }
//                dispatchGroup.leave()
//            }
        }
        
        queue3.async(group: dispatchGroup) {
            for i in 20..<30 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
//            dispatchGroup.enter()
//            Dispatch.DispatchQueue.global().async {
//                for i in 20..<30 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(i)
//                }
//                dispatchGroup.leave()
//            }
        }
        
        dispatchGroup.notify(queue: Dispatch.DispatchQueue.main) {
            print("모든 스레드 작업 끝")
        }
    }
    
    @IBAction func thirdBtnDidTap(_ sender: Any) {
        
        // 서로 다른 작업자 3명
        let queue1 = Dispatch.DispatchQueue(label: "Q1")
        let queue2 = Dispatch.DispatchQueue(label: "Q2")
        
        queue1.sync {
            for i in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
        }
        
        queue2.sync {
            for i in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
        }
    }
    
    
    func updateTimeLabel() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timeLabel.text = Date().timeIntervalSince1970.description
        }
    }
    
    
    func simpleClosure(completion: @escaping () -> Void) {
        
        Dispatch.DispatchQueue.global().async {
            for i in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(i)
            }
                
            
            completion()
        }
        
        
    }

}
