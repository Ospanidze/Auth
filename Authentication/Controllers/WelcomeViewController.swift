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
    //var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nameLabel.text = "Welcome, \(name ?? "Guest")"
        user()
    }
    
    func user() {
        guard nameLogin != nil else { return }
        nameLabel.text = "Welcome, \(nameLogin?.name ?? "Guest")"
    }
}
