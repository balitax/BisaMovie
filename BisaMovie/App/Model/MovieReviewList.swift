//
//  MovieReviewList.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct MovieReviewList: Codable {
    let results: [MovieReview]?
}

// MARK: - Result
struct MovieReview: Codable {
    let author, content, id: String?
    let url: String?
}

