//
//  GreetViewController.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit

protocol OpenVCDelegate{
    func openVC(identifier: String)
}

class GreetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        
    }
    @IBAction func tabAuthVC(_ sender: Any) {
        openVC(identifier: "AuthViewController")
    }
    
    @IBAction func tabRegVC(_ sender: Any) {
        openVC(identifier: "RegViewController")
    }
}
extension GreetViewController: OpenVCDelegate {
    
    func openVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
