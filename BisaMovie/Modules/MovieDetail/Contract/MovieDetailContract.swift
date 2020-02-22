//  
//  MovieDetailContract.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol MovieDetailView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: MovieDetailPresentation! { get set }
}

protocol MovieDetailPresentation: class {
    // TODO: Declare presentation methods
    var view: MovieDetailView! { get set }
    var interactor: MovieDetailUseCase! { get set }
    var router: MovieDetailWireframe! { get set }
    var viewModel: MovieDetailViewModel! { get set }
    
    func viewDidLoad()
}

protocol MovieDetailUseCase: class {
    // TODO: Declare use case methods
    var output: MovieDetailInteractorOutput! { get set }
}

protocol MovieDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol MovieDetailWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule(_ movie: Movie) -> UIViewController
}

