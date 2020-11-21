//
//  AboutViewController.swift
//  foodCatalogue
//
//  Created by aldo vernando on 21/11/20.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.width/2
    }
    
    @IBAction func linkedInButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://linkedin.com/in/aldo-vernando") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func githubButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://github.com/AldoVernando") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func instagramButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/aldo.vernando") {
            UIApplication.shared.open(url)
        }
    }
}
