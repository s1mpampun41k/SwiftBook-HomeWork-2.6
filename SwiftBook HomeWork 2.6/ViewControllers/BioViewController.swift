//
//  BioViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 25.03.25.
//

import UIKit

class BioViewController: UIViewController {

    @IBOutlet var bioLabel: UILabel!
    
    var myBio: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        bioLabel.text = myBio ?? "value is nil"
    }
}
