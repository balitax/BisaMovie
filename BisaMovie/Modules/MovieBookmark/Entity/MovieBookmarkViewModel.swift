//  
//  MovieBookmarkViewModel.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import Foundation

class MovieBookmarkViewModel {
    
    private(set) var items: [[CommonMovieBookmarkViewCellKind]] = []
    
    init() {
        items = [
            [
                .list
            ]
        ]
    }
    
//    func getItem(at indexPath: IndexPath) -> CellRepresentable {
//        let type = items[indexPath.section][indexPath.row]
//        switch type {
//        case .pattern:
//            break
//        default:
//            break
//        }
//    }
    
}
