//  
//  MovieBookmarkContract.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RealmSwift

protocol MovieBookmarkView: PresentableView, AlertableView {
    // TODO: Declare view methods
    var presenter: MovieBookmarkPresentation! { get set }
    func configureView(with state: ViewStateKind)
    func applyChanges(section: Int, deletions: [Int], insertions: [Int], modifications: [Int])
}

protocol MovieBookmarkPresentation: DataSource {
    // TODO: Declare presentation methods
    var view: MovieBookmarkView! { get set }
    var interactor: MovieBookmarkUseCase! { get set }
    var router: MovieBookmarkWireframe! { get set }
    
    func fetchBookmarkMovie()
    func deleteBookmark(_ index: IndexPath)
    func stopObserveBookmarkMovie()
}

protocol MovieBookmarkUseCase: class {
    // TODO: Declare use case methods
    var output: MovieBookmarkInteractorOutput! { get set }
    func fetchBookmarkMovie()
    func stopObserveBookmarkMovie()
    func deleteBookmark(_ index: IndexPath)
}

protocol MovieBookmarkInteractorOutput: class {
    // TODO: Declare interactor output methods
    func onError(error: String)
    func bookmarkDeleted()
    func applyChanges(changes: RealmCollectionChange<Results<MovieStorage>>)
}

protocol MovieBookmarkWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}

