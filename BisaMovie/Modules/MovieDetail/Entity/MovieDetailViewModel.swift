//  
//  MovieDetailViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    var id: Int?
    var detail: DetailMovie?
    var review: [MovieReview]?
    
    private(set) var items: [[CommonMovieDetailViewCellKind]] = []
    
    init() {
        items = [
            [ ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .detail:
            if let detail = self.detail {
                return MovieDetailTableViewCellViewModel(
                    movieImage: detail.posterPath,
                    movieTitle: detail.title,
                    movieDate: detail.releaseDate,
                    movieDescription: detail.overview)
            } else {
                return MovieDetailTableViewCellViewModel()
            }
        case .review:
            if let review = self.review {
                if !review.isEmpty {
                    let data = review[indexPath.row]
                    return ReviewListTableViewCellViewModel(
                        authorName: data.author,
                        authorReview: data.content)
                } else {
                    return ReviewListTableViewCellViewModel()
                }
            } else {
                return ReviewListTableViewCellViewModel()
            }
        }
    }
    
    func createItems() {
        let detailItems: [CommonMovieDetailViewCellKind] = [
            .detail
        ]
        var listsReview: [CommonMovieDetailViewCellKind] = []
        
        if let reviews = self.review {
            for _ in reviews {
                listsReview.append(.review)
            }
        }
        
        items.removeAll()
        items.append(detailItems)
        items.append(listsReview)
    }
    
}
