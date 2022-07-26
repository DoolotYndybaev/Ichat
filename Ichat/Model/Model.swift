//
//  Model.swift
//  Ichat
//
//  Created by Doolot on 26/7/22.
//

import UIKit

enum AuthResponses{
    case error
    case success
    case noVerify
}

struct LoginField {
    var email: String
    var password: String
}

struct ResponceCode {
    var code: Int
}
