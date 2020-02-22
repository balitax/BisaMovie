//  
//  MovieListUI.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift
import SkeletonView

class MovieListUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: MovieListPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewComponent()
        setupNavigation()
        tableView.showAnimatedSkeleton()
        presenter.fetchMovieList(.popular)
        
    }
    
    private func setupTableViewComponent() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(nib: MovieListTableViewCell.self)
        self.tableView.reloadData()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Popular"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.defaultTheme
        self.navigationController?.view.backgroundColor = UIColor.defaultTheme
    }
    
    @IBAction func didShowMovieCategory(_ sender: UIButton) {
        let popular = UIAlertAction(title: "Popular", style: .default) { action in
            self.navigationItem.title = "Popular"
            self.presenter.fetchMovieList(.popular)
        }
        
        let upcoming = UIAlertAction(title: "Upcoming", style: .default) { action in
            self.navigationItem.title = "Upcoming"
            self.presenter.fetchMovieList(.upcoming)
        }
        
        let toprated = UIAlertAction(title: "Top Rated", style: .default) { action in
            self.navigationItem.title = "Top Rated"
            self.presenter.fetchMovieList(.top_rated)
        }
        
        let nowplaying = UIAlertAction(title: "Now Playing", style: .default) { action in
            self.navigationItem.title = "Now Playing"
            self.presenter.fetchMovieList(.now_playing)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        self.showAlert(viewController: self, prefferedStyle: .actionSheet, title: "Choose movie category", message: nil, alertActions: [popular, upcoming, toprated, nowplaying, cancel])
    }
    
}

extension MovieListUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieListTableViewCell = tableView[indexPath]
        
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        cell.configure(with: item)
        cell.accessibilityLabel = item.type
        
        cell.hideSkeleton()
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MovieListUI: SkeletonTableViewDataSource {
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
    
}

extension MovieListUI: MovieListView {
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .error(let error):
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
                
            }
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [alertAction])
        default:
            self.tableView.hideSkeleton(transition: .crossDissolve(0.5))
            self.tableView.reloadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tableView.scroll(to: .top, animated: true)
            }
        }
    }
    
}


