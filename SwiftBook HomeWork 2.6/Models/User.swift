//
//  User.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 24.03.25.
//

import Foundation

struct User {
    
    var name: String
    var password: String

    static func getUser() -> User {
        User(name: "User", password: "Password")
    }
}


