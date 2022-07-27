//
//  GreetViewController.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit

protocol OpenVCDelegate{
    func openAuthVC()
    func openRegVC()
    func closeVC()
    func startApp()
}

class GreetViewController: UIViewController {
    
    var authVC: AuthViewController!
    var regVC: RegViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
    }
    @IBAction func tabAuthVC(_ sender: Any) {
        openAuthVC()
    }
    
    @IBAction func tabRegVC(_ sender: Any) {
        openRegVC()
    }
}
extension GreetViewController: OpenVCDelegate {

    func openRegVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        regVC = storyboard.instantiateViewController(withIdentifier: "RegViewController") as? RegViewController
        regVC.delegate = self
        self.view.insertSubview(regVC.view, at: 1)
    }
    
    func openAuthVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        authVC = storyboard.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
        authVC.delegate = self
        self.view.insertSubview(authVC.view, at: 1)
    }
    func closeVC() {
        if authVC != nil{
        authVC.view.removeFromSuperview()
        authVC = nil
        }
        if regVC != nil {
        regVC.view.removeFromSuperview()
        regVC = nil
        }
    }
    func startApp() {
        let startVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AppViewController")
        self.view.insertSubview(startVC.view, at: 2)
    }
}
