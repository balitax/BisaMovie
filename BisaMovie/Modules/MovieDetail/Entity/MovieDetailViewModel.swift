//  
//  MovieDetailViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    var movie: Movie!
    
    private(set) var items: [[CommonMovieDetailViewCellKind]] = []
    
    init() {
        items = [
            [
                .list
            ]
        ]
    }
    
}
