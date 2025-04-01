//
//  WelcomeViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 21.03.25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    
    var userName: String!
    var myName: String!
    var mySurname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(userName ?? "value is nil")!\n My name is \(myName ?? "value is nil") \(mySurname ?? "value is nil")"
        view.setGradientBackground()
    }
}
