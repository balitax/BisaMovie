//
//  MovieDetailTableViewCellViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct MovieDetailTableViewCellViewModel: CellRepresentable {
    
    var movieImage: String?
    var movieTitle: String?
    var movieDate: String?
    var movieDescription: String?
    
    init() {
        
    }
    
    init(movieImage: String?, movieTitle: String?, movieDate: String?, movieDescription: String?) {
        self.movieImage = movieImage
        self.movieTitle = movieTitle
        self.movieDate = movieDate
        self.movieDescription = movieDescription
    }
    
    var type: String = {
        return MovieDetailCellType.detail.rawValue
    }()
    
}
