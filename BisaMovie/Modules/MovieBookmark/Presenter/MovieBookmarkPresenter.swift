//  
//  MovieBookmarkPresenter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit


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
    
    func viewDidLoad() {  }
    
}

extension MovieBookmarkPresenter: MovieBookmarkInteractorOutput {
    
}
