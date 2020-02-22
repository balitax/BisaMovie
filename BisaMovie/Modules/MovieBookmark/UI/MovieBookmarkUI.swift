//  
//  MovieBookmarkUI.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit

class MovieBookmarkUI: UIViewController {

    var presenter: MovieBookmarkPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}


extension MovieBookmarkUI: MovieBookmarkView {
    
}


