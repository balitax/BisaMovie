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
    
    func viewDidLoad() {  }
    
}

extension MovieDetailPresenter: MovieDetailInteractorOutput {
    
}
