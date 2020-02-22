//  
//  MovieListRouter.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//


import Foundation
import UIKit

class MovieListRouter {

    weak var viewController: UIViewController?

}

extension MovieListRouter: MovieListWireframe {
    
    static func assembleModule() -> UIViewController {
        
        let view = MovieListUI()
        let viewModel = MovieListViewModel()
        let router = MovieListRouter()
        let interactor = MovieListInteractor()
        
        let presenter = MovieListPresenter(
        view: view,
        viewModel: viewModel,
        interactor: interactor,
        router: router)
        
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = view
        
        interactor.output = presenter
        
        return navigation
    }
    
    func presentDetail(_ id: Int, from view: PresentableView) {
        let detail = MovieDetailRouter.assembleModule(id)
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.pushViewController(detail, animated: true)
        }
    }
    
    func presentBookmarkMovie(from view: PresentableView) {
        let bookmark = MovieBookmarkRouter.assembleModule()
        if let navigationController = view.presentedViewController() as? UINavigationController {
            navigationController.pushViewController(bookmark, animated: true)
        }
    }
    
}
