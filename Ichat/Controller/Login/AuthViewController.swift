//
//  AuthViewController.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class AuthViewController: UIViewController {
    var delegate: OpenVCDelegate!
    var userDefault = UserDefaults.standard

    
    var service = Service.shared
    var tapGest: UITapGestureRecognizer?
    var checkdield = CheckField.shared
    
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
    }
    @objc func endEditing() {
        self.view.endEditing(true)
    }
    @IBAction func backGreetVC(_ sender: Any) {
        delegate.closeVC()
    }
    
    @IBAction func noAccountBtn(_ sender: Any) {
    }
    
    @IBAction func sigInBtn(_ sender: Any) {
        if checkdield.validField(emailView, emailField), checkdield.validField(passwordView, passwordField)
        {
            let authData = LoginField(email: emailField.text!, password: passwordField.text!)
            service.authInApp(authData) {[weak self] responce in
                switch responce {
                case .error:
                    let alert = self?.alertAction("Ошибка", massage: "проверьте введённые данные и повторите попытку")
                    let verefyBtn = UIAlertAction(title: "ok", style: .cancel)
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                case .success:
                    print("next")
                    self?.userDefault.set(true, forKey: "isLogin")
                    self?.delegate.startApp()
                    self?.delegate.closeVC()
                case .noVerify:
                    let alert = self?.alertAction("Ошибка", massage: "Вы не верифицировали свой аккаунт!\n Проверьте свою почту!")
                    let verefyBtn = UIAlertAction(title: "ok", style: .cancel){_ in
                        
                    }
                    alert?.addAction(verefyBtn)
                    self?.present(alert!, animated: true)
                }
            }
        }
    }
    func alertAction(_ header: String?, massage: String?) -> UIAlertController{
        let alert = UIAlertController(title: header, message: massage, preferredStyle: .alert)
        return alert
    }
}
