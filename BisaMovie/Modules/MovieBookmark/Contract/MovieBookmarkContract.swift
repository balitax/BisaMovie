//  
//  MovieBookmarkContract.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

protocol MovieBookmarkView: PresentableView {
    // TODO: Declare view methods
    var presenter: MovieBookmarkPresentation! { get set }
}

protocol MovieBookmarkPresentation: class {
    // TODO: Declare presentation methods
    var view: MovieBookmarkView! { get set }
    var interactor: MovieBookmarkUseCase! { get set }
    var router: MovieBookmarkWireframe! { get set }
    
    func viewDidLoad()
}

protocol MovieBookmarkUseCase: class {
    // TODO: Declare use case methods
    var output: MovieBookmarkInteractorOutput! { get set }
}

protocol MovieBookmarkInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol MovieBookmarkWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

