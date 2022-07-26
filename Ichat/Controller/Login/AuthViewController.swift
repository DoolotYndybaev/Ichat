//
//  AuthViewController.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
    }
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    @IBAction func backGreetVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GreetViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
