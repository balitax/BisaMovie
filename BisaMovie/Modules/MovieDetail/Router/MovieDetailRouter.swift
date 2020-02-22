//  
//  MovieDetailRouter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class MovieDetailRouter {

    weak var viewController: UIViewController?

}

extension MovieDetailRouter: MovieDetailWireframe {
    
    static func assembleModule(_ movie: Movie) -> UIViewController {
        
        let view = MovieDetailUI()
        let viewModel = MovieDetailViewModel()
        let router = MovieDetailRouter()
        let interactor = MovieDetailInteractor()
        
        let presenter = MovieDetailPresenter(
        view: view,
        viewModel: viewModel,
        interactor: interactor,
        router: router)
        
        view.presenter =  presenter
        viewModel.movie = movie
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
}
