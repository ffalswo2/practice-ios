//
//  FirstViewController.swift
//  practice-ios
//
//  Created by 김민재 on 2022/05/22.
//

import UIKit

/*
 Passing Data 6가지 + 방향
 1. instance property (-> 일루갈때)
 2. segue (-> 일루갈때)
 3. 내가 가진 instance 다 넘겨주기 (<- 방향이 반대)
 4. delegate pattern (대리 위임) (<-)
 5. closure
 6. Notification
 */

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var instanceCheckLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotification()
        
    }
    
    func setNotification() {
        let notificationName = Notification.Name("sendData")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMessageBeforeKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func showMessageBeforeKeyboard() {
        print("키보드가 올라가요")
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.instanceCheckLabel.text = str
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detail = segue.destination as? SegueViewController {
                detail.string = "aaaa"
            }
        }
    }
    

    @IBAction func moveBtnDidTap(_ sender: Any) {
        guard let secondVC = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        secondVC.someString = textField.text ?? ""
        
        self.present(secondVC, animated: true)
    }
    

    @IBAction func moveToInstance(_ sender: Any) {
        
        guard let instanceVC = UIStoryboard(name: "Instance", bundle: nil).instantiateViewController(withIdentifier: "InstanceViewController") as? InstanceViewController else { return }
        
        // not copy - pointer
        // 나 넘겨줄게
        instanceVC.firstVC = self
        
        self.present(instanceVC, animated: true)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        
        guard let delegateVC = UIStoryboard(name: "Delegate", bundle: nil).instantiateViewController(withIdentifier: "DelegateViewController") as? DelegateViewController else { return }
        
        delegateVC.delegate = self
        
        self.present(delegateVC, animated: true)
        
    }
    @IBAction func moveToClosure(_ sender: Any) {
        
        guard let closureVC = UIStoryboard(name: "Closure", bundle: nil).instantiateViewController(withIdentifier: "ClosureViewController") as? ClosureViewController else { return }
        
        closureVC.closure = { str in
            self.instanceCheckLabel.text = str
            
        }
        
        self.present(closureVC, animated: true)
    }
    @IBAction func moveToNoti(_ sender: Any) {
        guard let notiVC = UIStoryboard(name: "Noti", bundle: nil).instantiateViewController(withIdentifier: "NotiViewController") as? NotiViewController else { return }
        
        self.present(notiVC, animated: true)
        
    }
}

extension FirstViewController: DelegateViewControllerDelegate {
    func passString(string: String) {
        self.instanceCheckLabel.text = string
    }
    
    
}
