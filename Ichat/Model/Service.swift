//
//  Service.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Service {
    static let shared = Service()
    
    init(){}
    
    
    func createNewUser(_ data: LoginField, completion: @escaping (ResponceCode)->())
    {
        Auth.auth().createUser(withEmail: data.email, password:data.password) {  result, err in
            if err == nil {
                if result != nil {
                    let userID = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email":email]
                    Firestore.firestore().collection("users").document(userID!).setData(data)
                    completion(ResponceCode(code: 1))
                }
            } else {
                completion(ResponceCode(code: 0))
            }
        }
    }
    func configureEmail(){
        Auth.auth().currentUser?.sendEmailVerification(completion: { err in
            if err != nil {
                print(err?.localizedDescription as Any)
            }
        })
    }
}
