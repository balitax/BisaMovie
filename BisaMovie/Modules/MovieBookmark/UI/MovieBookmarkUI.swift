//  
//  MovieBookmarkUI.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MovieBookmarkUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: MovieBookmarkPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewComponent()
        presenter.fetchBookmarkMovie()
        self.navigationItem.title = "Movie Bookmarked"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        presenter.stopObserveBookmarkMovie()
    }
    
    private func setupTableViewComponent() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.registerReusableCell(MovieListTableViewCell.self)
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.barTintColor = UIColor.defaultTheme
    }
    
}


extension MovieBookmarkUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier, for: indexPath) as! MovieListTableViewCell
        
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        cell.configure(with: item)
        cell.accessibilityLabel = item.type
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteBookmark(indexPath)
        }
    }
    
}


extension MovieBookmarkUI: MovieBookmarkView {
    
    func configureView(with state: ViewStateKind) {
        switch state {
        case .error(let error):
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { _ in
                
            }
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Error!", message: error, alertActions: [alertAction])
        default:
            self.tableView.hideSkeleton(transition: .crossDissolve(0.5))
            self.tableView.reloadData()
        }
    }
    
    func applyChanges(section: Int, deletions: [Int], insertions: [Int], modifications: [Int]) {
        self.tableView.reloadData()
    }
    
}


