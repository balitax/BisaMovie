//
//  Constant.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct Constant {
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "86326ce41dbf85964b57befc0d49840e"
    static let imagePath = "https://image.tmdb.org/t/p/original/"
    
}

enum MovieType: String {
    case popular
    case upcoming
    case top_rated
    case now_playing
}
