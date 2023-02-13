//
//  YourPageViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class YourPageViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    var nameLogin: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameLogin
    }
    
    @IBAction func logOutButtonTapped() {
        dismiss(animated: true)
    }
}
