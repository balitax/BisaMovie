//  
//  MovieDetailInteractor.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailInteractor {
    // TODO: Declare view methods
    weak var output: MovieDetailInteractorOutput!
    private var disposeBag = DisposeBag()
    
}

extension MovieDetailInteractor: MovieDetailUseCase {
    
    func fetchDetailMovie(_ id: Int) {
        APIClient.request(with: APIRouter.detail(id: id), codable: DetailMovie.self)
            .asObservable()
            .subscribe(onNext: { detail in
                self.output.onDetailLoaded(detail)
            }, onError: { error in
                self.output.onError(error)
            }).disposed(by: disposeBag)
    }
    
    func fetchReviewMovie(_ id: Int) {
        APIClient.request(with: APIRouter.review(id: id), codable: MovieReviewList.self)
            .asObservable()
            .subscribe(onNext: { review in
                if let movieReview = review.results {
                    self.output.onReviewLoaded(movieReview)
                }
            }, onError: { error in
                self.output.onError(error)
            }).disposed(by: disposeBag)
    }
    
}
