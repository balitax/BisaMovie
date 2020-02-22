//  
//  MovieDetailUI.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MovieDetailUI: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDateRelease: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    var presenter: MovieDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.bindData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationItem.rightBarButtonItem?.addToolTip(description: "Tap this button to bookmark this movie")
        self.navigationItem.rightBarButtonItem?.showToolTip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = presenter.viewModel.movie.title
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barTintColor = UIColor.defaultTheme
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.view.backgroundColor = UIColor.defaultTheme
        
        let favoriteButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(self.didBookMarkItem(_:)))
        self.navigationItem.rightBarButtonItem = favoriteButtonItem
        
    }
    
    @objc func didBookMarkItem(_ sender: UIBarButtonItem) {
        let movie = presenter.viewModel.movie
        
        let getMovie = MovieStorage().apply { mov in
            mov.keyId = mov.incrementID()
            mov.id = movie?.id ?? 0
            mov.title = movie?.title
            mov.posterPath = movie?.posterPath
            mov.backdropPath = movie?.backdropPath
            mov.overview = movie?.overview
            mov.releaseDate = movie?.releaseDate
        }
        
        Database.shared.save(object: getMovie)
        let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            
        }
        self.showAlert(viewController: self, prefferedStyle: .alert, title: "Success!", message: "Movie has been bookmarked", alertActions: [alertAction])
        
    }
    
}


extension MovieDetailUI: MovieDetailView {
    
    func bindData() {
        self.movieImage.setImage(presenter.viewModel.movie.posterPath ?? "")
        self.backgroundImage.setImage(presenter.viewModel.movie.backdropPath ?? "")
        self.movieTitle.text = presenter.viewModel.movie.title
        self.movieDateRelease.text = presenter.viewModel.movie.releaseDate
        self.movieOverview.text = presenter.viewModel.movie.overview
    }
    
}


