//  
//  MovieDetailPresenter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


/// MovieDetailPresenter
class MovieDetailPresenter {
    // TODO: Declare view methods
    var view: MovieDetailView!
    var viewModel: MovieDetailViewModel!
    var router: MovieDetailWireframe!
    var interactor: MovieDetailUseCase!
    
    init(
        view: MovieDetailView,
        viewModel: MovieDetailViewModel,
        interactor: MovieDetailUseCase,
        router: MovieDetailWireframe) {
        
        self.view = view
        self.viewModel = viewModel
        self.interactor = interactor
        self.router = router
        
    }
    
}

extension MovieDetailPresenter: MovieDetailPresentation {
    
    func numberOfSection() -> Int {
        return viewModel.items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
         return viewModel.items[section].count
    }
    
    func item(at indexPath: IndexPath) -> CellRepresentable {
        return viewModel.getItem(at: indexPath)
    }
    
    func fetchDetailMovie() {
        interactor.fetchDetailMovie(viewModel.id ?? 0)
    }
    
    func fetchReviewMovie() {
        interactor.fetchReviewMovie(viewModel.id ?? 0)
    }
    
}

extension MovieDetailPresenter: MovieDetailInteractorOutput {
    
    func onError(_ error: Error) {
        view.configureView(with: .error(description: error.localizedDescription))
    }
    
    func onDetailLoaded(_ data: DetailMovie) {
        viewModel.detail = data
        view.configureView(with: .success)
    }
    
    func onReviewLoaded(_ data: [MovieReview]) {
        viewModel.review = data
        viewModel.createItems()
        view.configureView(with: .success)
    }
    
}
