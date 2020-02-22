//  
//  MovieDetailUI.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import SkeletonView

class MovieDetailUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MovieDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewComponent()
        presenter.fetchDetailMovie()
        presenter.fetchReviewMovie()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "infoTappedBefore")
        if !launchedBefore  {
            self.navigationItem.rightBarButtonItem?.addToolTip(description: "Tap this button to bookmark this movie")
            self.navigationItem.rightBarButtonItem?.showToolTip()
            UserDefaults.standard.set(true, forKey: "infoTappedBefore")
        }
        
    }
    
    private func setupTableViewComponent() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.contentInset = UIEdgeInsets(top: -18, left: 0, bottom: 0, right: 0)
        self.tableView.registerReusableCell(MovieDetailTableViewCell.self)
        self.tableView.registerReusableCell(ReviewListTableViewCell.self)
        self.tableView.reloadData()
        self.tableView.showAnimatedSkeleton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barTintColor = UIColor.defaultTheme
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.view.backgroundColor = UIColor.defaultTheme
        
        let favoriteButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(self.didBookMarkItem(_:)))
        self.navigationItem.rightBarButtonItem = favoriteButtonItem
        
    }
    
    @objc func didBookMarkItem(_ sender: UIBarButtonItem) {
        guard let movie = presenter.viewModel.detail else { return }
        
        let getMovie = MovieStorage().apply { mov in
            mov.keyId = mov.incrementID()
            mov.id = movie.id ?? 0
            mov.title = movie.title
            mov.posterPath = movie.posterPath
            mov.backdropPath = movie.backdropPath
            mov.overview = movie.overview
            mov.releaseDate = movie.releaseDate
        }
        
        Database.shared.save(object: getMovie)
        let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            
        }
        self.showAlert(viewController: self, prefferedStyle: .alert, title: "Success!", message: "Movie has been bookmarked", alertActions: [alertAction])
        
    }
}


extension MovieDetailUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type, for: indexPath)
        
        (cell as? CellConfigurable)?.configure(with: item)
        cell.accessibilityLabel = item.type
        
        cell.hideSkeleton()
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Review Users"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}

extension MovieDetailUI: SkeletonTableViewDataSource {
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        if indexPath.row == 0 {
            return MovieDetailTableViewCell.reuseIdentifier
        } else {
            return ReviewListTableViewCell.reuseIdentifier
        }
    }
    
}

extension MovieDetailUI: MovieDetailView {
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .error(let error):
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
                
            }
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [alertAction])
        default:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tableView.hideSkeleton(transition: .crossDissolve(0.5))
                self.tableView.reloadData()
            }
            self.navigationItem.title = presenter.viewModel.detail?.title
        }
    }
    
}


