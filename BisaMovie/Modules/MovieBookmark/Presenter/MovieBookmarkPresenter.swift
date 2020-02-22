//  
//  MovieBookmarkPresenter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RealmSwift

/// MovieBookmarkPresenter
class MovieBookmarkPresenter {
    // TODO: Declare view methods
    var view: MovieBookmarkView!
    var viewModel: MovieBookmarkViewModel!
    var router: MovieBookmarkWireframe!
    var interactor: MovieBookmarkUseCase!
    
    init(
        view: MovieBookmarkView,
        viewModel: MovieBookmarkViewModel,
        interactor: MovieBookmarkUseCase,
        router: MovieBookmarkWireframe) {
        
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
        
    }
    
}

extension MovieBookmarkPresenter: MovieBookmarkPresentation {
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
    func fetchBookmarkMovie() {
        interactor.fetchBookmarkMovie()
    }
    
    func stopObserveBookmarkMovie() {
        interactor.stopObserveBookmarkMovie()
    }
    
    func deleteBookmark(_ index: IndexPath) {
        interactor.deleteBookmark(index)
    }
}

extension MovieBookmarkPresenter: MovieBookmarkInteractorOutput {
    
    func onError(error: String) {
        self.view.configureView(with: .error(description: error))
    }
    
    func bookmarkDeleted() {
         self.view.configureView(with: .success)
    }
    
    func applyChanges(changes: RealmCollectionChange<Results<MovieStorage>>) {
        switch changes {
        case .initial(let collection):
            viewModel.movie = Array(collection)
            viewModel.createItems()
            view.configureView(with: .success)
        case .update(let (collection, deletions, insertions, modifications)):
            viewModel.movie = Array(collection)
            view.applyChanges(section: 0, deletions: deletions, insertions: insertions, modifications: modifications)
            viewModel.createItems()
        case .error(let error):
            view.configureView(with: .error(description: error.localizedDescription))
        }
    }
    
}
