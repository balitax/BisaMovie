//  
//  MovieBookmarkRouter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class MovieBookmarkRouter {

    weak var viewController: UIViewController?

}

extension MovieBookmarkRouter: MovieBookmarkWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = MovieBookmarkUI()
        let viewModel = MovieBookmarkViewModel()
        let router = MovieBookmarkRouter()
        let interactor = MovieBookmarkInteractor()
        
        let presenter = MovieBookmarkPresenter(
        view: view,
        viewModel: viewModel,
        interactor: interactor,
        router: router)
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return view
    }
    
}
