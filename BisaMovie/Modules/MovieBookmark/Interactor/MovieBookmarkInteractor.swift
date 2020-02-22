//  
//  MovieBookmarkInteractor.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RealmSwift

class MovieBookmarkInteractor {
    // TODO: Declare view methods
    weak var output: MovieBookmarkInteractorOutput!
    var notificationToken: NotificationToken? = nil
    
}

extension MovieBookmarkInteractor: MovieBookmarkUseCase {
    
    func fetchBookmarkMovie() {
        notificationToken = Database.shared.get(type: MovieStorage.self)?.observe(output.applyChanges(changes:))
    }
    
    func stopObserveBookmarkMovie() {
        notificationToken?.invalidate()
    }
    
    func deleteBookmark(_ index: IndexPath) {
        guard let getBookmark = Database.shared.get(type: MovieStorage.self) else {
            return self.output.onError(error: "Can't rettrive data from your local storage")
        }
        
        let deleteBookmark = getBookmark[index.row]
        Database.shared.delete(object: deleteBookmark)
        notificationToken = Database.shared.get(type: MovieStorage.self)?.observe(output.applyChanges(changes:))
    }
    
}
