//
//  ReviewListTableViewCellViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

struct ReviewListTableViewCellViewModel: CellRepresentable {
    
    var authorName: String?
    var authorReview: String?
    
    init() {
        
    }
    
    init(authorName: String?, authorReview: String?) {
        self.authorName = authorName
        self.authorReview = authorReview
    }
    
    
    var type: String = {
        return MovieDetailCellType.review.rawValue
    }()
    
}
