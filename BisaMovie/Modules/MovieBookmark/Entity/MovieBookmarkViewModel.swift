//  
//  MovieBookmarkViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class MovieBookmarkViewModel {
    
    var movie = [MovieStorage]()
    
    private(set) var items: [[CommonMovieBookmarkViewCellKind]] = []
    
    init() {
        items = [
            [
                .list
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .list:
            if !movie.isEmpty {
                let data = self.movie[indexPath.row]
                return MovieListTableViewCellViewModel(
                    movieImage: data.posterPath,
                    movieTitle: data.title,
                    movieDate: data.releaseDate,
                    movieDescription: data.overview)
            } else {
                return MovieListTableViewCellViewModel()
            }
        }
    }
    
    func createItems() {
        var listsMovie: [CommonMovieBookmarkViewCellKind] = []
        
        for _ in movie {
            listsMovie.append(.list)
        }
        
        items.removeAll()
        items.append(listsMovie)
    }
    
}
