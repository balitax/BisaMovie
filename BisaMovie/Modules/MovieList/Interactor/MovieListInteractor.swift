//  
//  MovieListInteractor.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class MovieListInteractor {
    // TODO: Declare view methods
    weak var output: MovieListInteractorOutput!
    private var disposeBag = DisposeBag()
}

extension MovieListInteractor: MovieListUseCase {
    
    
    /// Fetching movie list
    /// - Parameter type: type movie
    func fetchMovieList(_ type: MovieType) {
        var router = APIRouter.popular
        switch type {
        case .popular:
            router = APIRouter.popular
        case .upcoming:
            router = APIRouter.upcoming
        case .top_rated:
            router = APIRouter.top_rated
        case .now_playing:
            router = APIRouter.now_playing
        }
        
        APIClient.request(with: router, codable: MovieList.self)
            .asObservable()
            .subscribe(onNext: { movielist in
                if let movies = movielist.results {
                    self.output.onMovieListLoaded(movies)
                }
            }, onError: { error in
                self.output.onError(error: error)
            }).disposed(by: disposeBag)
        
    }
    
    
}
