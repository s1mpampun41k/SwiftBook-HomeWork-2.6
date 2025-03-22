//
//  ViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 21.03.25.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == user.name,
              passwordTF.text == user.password else {
            showAllert(
                withTitle: "Invalid login or password",
                andMassage: "Please, enter correct login and password"
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


    private func showAllert(withTitle title: String, andMassage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func logInAction() {
    }
    
    @IBAction func suggestUserName() {
        showAllert(withTitle: "Oops", andMassage: "Your name is User 😉")
    }
    
    @IBAction func suggestPassword() {
        showAllert(withTitle: "Oops", andMassage: "Your name is Password 😉")
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

