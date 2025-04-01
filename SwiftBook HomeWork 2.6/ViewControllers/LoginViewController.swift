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
    
    private var newUser = User.getUser()
    private var myPerson = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = newUser.name
        passwordTF.text = newUser.password
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard userNameTF.text == newUser.name,
              passwordTF.text == newUser.password else {
            showAllert(
                withTitle: "Invalid login or password",
                andMassage: "Please, enter correct login and password"
            )
            
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tabBarVC = segue.destination as? UITabBarController {
            tabBarVC.viewControllers?.forEach { viewController in
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.userName = userNameTF.text
                    welcomeVC.myName = myPerson.name
                    welcomeVC.mySurname = myPerson.surname
                } else if let navigationVC = viewController as? UINavigationController {
                    if let homeVC = navigationVC.topViewController as? HomeViewController {
                        homeVC.title = "\(myPerson.name) \(myPerson.surname)"
                        homeVC.name = myPerson.name
                        homeVC.surname = myPerson.surname
                        homeVC.age = String(myPerson.age)
                        homeVC.education = myPerson.education
                        homeVC.location = myPerson.location
                        homeVC.myBio = myPerson.aboutMe
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


    private func showAllert(
        withTitle title: String,
        andMassage message: String
        ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func logInAction() {
    }
    
    @IBAction func suggestUserName() {
        showAllert(
            withTitle: "Oops",
            andMassage: "Your name is User 😉"
        )
    }
    
    @IBAction func suggestPassword() {
        showAllert(
            withTitle: "Oops",
            andMassage: "Your password is Password 😉"
        )
        passwordTF.text = ""

    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}
