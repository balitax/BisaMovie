//
//  MovieList.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

// MARK: - MovieList
struct MovieList: Codable {
    let page, totalResults, totalPages: Int?
    let results: [Movie]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Movie: Codable {
    let posterPath: String?
    let backdropPath: String?
    let id: Int?
    let title: String?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case id
        case title
        case overview
        case releaseDate = "release_date"
    }
}
