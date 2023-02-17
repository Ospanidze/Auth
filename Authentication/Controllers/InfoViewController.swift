//
//  InfoViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 17.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var personInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = personInfo
    }
}
