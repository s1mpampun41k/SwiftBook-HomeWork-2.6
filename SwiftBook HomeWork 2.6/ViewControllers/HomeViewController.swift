//
//  HomeViewController.swift
//  SwiftBook HomeWork 2.6
//
//  Created by Ярослав Шепелевский on 25.03.25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var educationLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var myPhotoImageView: UIImageView!
    
    var name: String!
    var surname: String!
    var age: String!
    var education: String!
    var location: String!
    
    var myBio: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        navigationItem.backButtonTitle = self.title

        
        myPhotoImageView.image = UIImage(named: "myPhoto")
        myPhotoImageView.layer.cornerRadius = myPhotoImageView.frame.width / 2
        myPhotoImageView.clipsToBounds = true
        myPhotoImageView.contentMode = .scaleAspectFit
        view.addSubview(myPhotoImageView)
        
        nameLabel.text = name ?? "value is nil"
        surnameLabel.text = surname ?? "value is nil"
        ageLabel.text = age ?? "value is nil"
        educationLabel.text = education ?? "value is nil"
        locationLabel.text = location ?? "value is nil"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bioVC: BioViewController = segue.destination as? BioViewController {
            bioVC.title = "\(name ?? "value is nil") Bio"
            bioVC.myBio = myBio
            let backButton = UIBarButtonItem()
            backButton.title = "\(name ?? "value is nil") \(surname ?? "value is nil")"
            backButton.tintColor = UIColor.white
            navigationItem.backBarButtonItem = backButton
            
        }
    }
    

}
