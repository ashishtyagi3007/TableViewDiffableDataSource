//
//  MarvelsCharacterTableViewCell.swift
//  TableViewDiffableDataSource
//
//  Created by Ashish Tyagi on 05/05/21.
//

import UIKit

class MarvelsCharacterTableViewCell: UITableViewCell {

    // MARK:- outlets
    @IBOutlet weak var marvelsImageView: UIImageView!
    @IBOutlet weak var marvelsTitleLabel: UILabel!
    @IBOutlet weak var marvelsPowerLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK:- variables
    override class func description() -> String {
        return "MarvelsCharacterTableViewCell"
    }
    
    // MARK:- lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK:- functions
    func setupCell(charactersData: CharactersData) {
        self.containerView.layer.cornerRadius = 12
        self.containerView.layer.masksToBounds = false
        self.setShadow()
        
        self.marvelsImageView.layer.cornerRadius = 8
        self.marvelsImageView.layer.borderWidth = 0.25
        self.marvelsImageView.layer.borderColor = UIColor.label.withAlphaComponent(0.2).cgColor
        
        self.marvelsImageView.image = UIImage(named: charactersData.image)
        self.marvelsTitleLabel.text = charactersData.name
        self.marvelsPowerLabel.text = ""
    }
    
    func setShadow() {
        self.containerView.layer.shadowColor = UIColor.label.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.containerView.layer.shadowRadius = 4
        self.containerView.layer.shadowOpacity = 0.2
    }
    
}
