//
//  MovieDetailTableViewCell.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDateRelease: UILabel!
    @IBOutlet weak var movieOverview: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MovieDetailTableViewCell: CellConfigurable {
    
    func configure(with model: CellRepresentable) {
        if let data = model as? MovieDetailTableViewCellViewModel {
            
            if let desc = data.movieDescription {
                self.movieOverview.text = desc
            }
            
            if let date = data.movieDate {
                self.movieDateRelease.text = date
            }

            if let title = data.movieTitle {
                self.movieTitle.text = title
            }

            if let image = data.movieImage {
                self.movieImage.setImage(image)
            }
            
        }
    }
    
}
