//  
//  MovieListContract.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol MovieListView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: MovieListPresentation! { get set }
    func configureView(with state: ViewStateKind)
}

protocol MovieListPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: MovieListView! { get set }
    var interactor: MovieListUseCase! { get set }
    var router: MovieListWireframe! { get set }
    
    func fetchMovieList(_ type: MovieType)
    func presentDetail(_ index: IndexPath)
    func presentBookmarkMovie()
    
}

protocol MovieListUseCase: class {
    // TODO: Declare use case methods
    var output: MovieListInteractorOutput! { get set }
    func fetchMovieList(_ type: MovieType)
}

protocol MovieListInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onError(error: Error)
    func onMovieListLoaded(_ data: [Movie])
}

protocol MovieListWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
    func presentDetail(_ id: Int, from view: PresentableView)
    func presentBookmarkMovie(from view: PresentableView)
}

