//
//  MovieListTableViewCell.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MovieListTableViewCell: CellConfigurable {
    
    func configure(with model: CellRepresentable) {
        if let data = model as? MovieListTableViewCellViewModel {
            self.movieDescription.text = data.movieDescription
            self.movieReleaseDate.text = data.movieDate
            self.movieTitle.text = data.movieTitle
            self.movieImage.setImage(data.movieImage ?? "")
        }
    }
    
}
