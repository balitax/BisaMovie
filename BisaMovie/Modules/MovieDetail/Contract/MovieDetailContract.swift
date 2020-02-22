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
    func configureView(with state: ViewStateKind)
}

protocol MovieDetailPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: MovieDetailView! { get set }
    var interactor: MovieDetailUseCase! { get set }
    var router: MovieDetailWireframe! { get set }
    var viewModel: MovieDetailViewModel! { get set }
    
    func fetchDetailMovie()
    func fetchReviewMovie()
}

protocol MovieDetailUseCase: class {
    // TODO: Declare use case methods
    var output: MovieDetailInteractorOutput! { get set }
    func fetchDetailMovie(_ id: Int)
    func fetchReviewMovie(_ id: Int)
}

protocol MovieDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onDetailLoaded(_ data: DetailMovie)
    func onReviewLoaded(_ data: [MovieReview])
    func onError(_ error: Error)
}

protocol MovieDetailWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule(_ id: Int) -> UIViewController
}

