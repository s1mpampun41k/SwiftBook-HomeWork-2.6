//
//  ViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 21.03.25.
//

import UIKit

enum typeOfAlert {
    case suggestUserName
    case suggestPassword
    case incorrectPasswordOrUserName
}

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var user = User()
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == user.name,
              passwordTF.text == user.password else {
            showAllert(
                withTitle: "Invalid login or password",
                andMassage: "Please, enter correct login and password",
                for: .incorrectPasswordOrUserName
            )
            
            return false
        }
        
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.userName = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


    private func showAllert(
        withTitle title: String,
        andMassage message: String,
        for type: typeOfAlert
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            switch type {
            case .suggestUserName:
                self.userNameTF.text = ""
            case .suggestPassword:
                self.passwordTF.text = ""
            default:
                self.userNameTF.text = ""
                self.passwordTF.text = ""
            }
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func logInAction() {
    }
    
    @IBAction func suggestUserName() {
        showAllert(
            withTitle: "Oops",
            andMassage: "Your name is User 😉",
            for: .suggestUserName
        )
    }
    
    @IBAction func suggestPassword() {
        showAllert(
            withTitle: "Oops",
            andMassage: "Your password is Password 😉",
            for: .suggestPassword
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        _ = segue.source as? WelcomeViewController
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

final class User {
    
    let name: String
    let password: String
    
    init() {
        name = "User"
        password = "Password"
    }
    
}

