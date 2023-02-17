//
//  PersonViewController.swift
//  Authentication
//
//  Created by Айдар Оспанов on 17.02.2023.
//

import UIKit

class PersonViewController: UIViewController {
        
// MARK: IBOutlets
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var kindLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    
    @IBOutlet var photoImageView: UIImageView!
    
//MARK: Public Properties
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person?.name
        
        setupViews()
    }
    
// MARK: Override Methods
    
    override func viewWillLayoutSubviews() {
        photoImageView.layer.cornerRadius = photoImageView.frame.width / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoWc = segue.destination as? InfoViewController else { return }
        infoWc.personInfo = person?.description
    }
    
// MARK: Private Methods
    
    private func setupViews() {
        nickNameLabel.text = person?.nickName
        nameLabel.text = person?.name
        positionLabel.text = person?.position
        kindLabel.text = person?.kind.rawValue
        originLabel.text = person?.ogirin
        
        photoImageView.image = person?.photo
    }
    
}
