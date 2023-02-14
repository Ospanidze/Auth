//
//  YourPageViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 13.02.2023.
//

import UIKit

final class PageViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    var nameLogin: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Welcome, \(nameLogin ?? "Guest")"
    }
}
