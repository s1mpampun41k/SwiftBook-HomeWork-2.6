//
//  GradientBackgroundConfiguration.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 31.03.25.
//

import UIKit

extension UIView {
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            UIColor(red: 217/255, green: 121/255, blue: 147/255, alpha: 1.0).cgColor,
            UIColor(red: 120/255, green: 157/255, blue: 232/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
