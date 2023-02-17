//
//  YourPageViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    var nameLogin: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Welcome, \(nameLogin?.name ?? "Guest")"
    }
}
