//
//  ReviewListTableViewCell.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class ReviewListTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var avatarAuthor: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.avatarAuthor.layer.cornerRadius = self.avatarAuthor.frame.size.width / 2
        self.avatarAuthor.clipsToBounds = true
        self.avatarAuthor.backgroundColor = UIColor.defaultTheme
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ReviewListTableViewCell: CellConfigurable {
    
    func configure(with model: CellRepresentable) {
        if let data = model as? ReviewListTableViewCellViewModel {
            
            if let author = data.authorName {
                self.authorName.text = author
            }
            
            if let review = data.authorReview {
                self.authorReview.text = review
            }
            
        }
    }
    
}
