//  
//  MovieListPresenter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


/// MovieListPresenter
class MovieListPresenter {
    // TODO: Declare view methods
    var view: MovieListView!
    var viewModel: MovieListViewModel!
    var router: MovieListWireframe!
    var interactor: MovieListUseCase!
    
    init(
        view: MovieListView,
        viewModel: MovieListViewModel,
        interactor: MovieListUseCase,
        router: MovieListWireframe) {
        
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
        
    }
    
}

extension MovieListPresenter: MovieListPresentation {
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
    func fetchMovieList(_ type: MovieType) {
        interactor.fetchMovieList(type)
    }
    
}

extension MovieListPresenter: MovieListInteractorOutput {
    
    func onMovieListLoaded(_ data: [Movie]) {
        viewModel.movie = data
        viewModel.createItems()
        self.view.configureView(with: .success)
    }
    
    func onError(error: Error) {
        self.view.configureView(with: .error(description: error.localizedDescription))
    }
    
}
