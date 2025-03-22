//
//  WelcomeViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 21.03.25.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let gradientLayer = CAGradientLayer()
    @IBOutlet var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(userName!)!"
        setGradientBackground()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            gradientLayer.frame = view.bounds
        }

        private func setGradientBackground() {
            gradientLayer.colors = [
                UIColor(red: 217/255, green: 121/255, blue: 147/255, alpha: 1.0).cgColor, // Розовый
                UIColor(red: 120/255, green: 157/255, blue: 232/255, alpha: 1.0).cgColor  // Голубой
            ]
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0) // Верх
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)   // Низ
            gradientLayer.frame = view.bounds

            view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    
}
