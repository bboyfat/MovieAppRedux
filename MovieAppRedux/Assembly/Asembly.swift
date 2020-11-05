//
//  Asembly.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

protocol Assembly {
    func initialController() -> UIViewController
    func showController(m: Movies) -> UIViewController
}

class MovieAssembly: Assembly {
    
    func initialController() -> UIViewController {
        let c = MovieListController()
        c.hero.isEnabled = true
        let tv = (c.view as? MovieListView)?.tableView
        let ds = MoviesTableViewManager(tableView: tv)
        c.setDataSource(ds: ds)
        return c
    }
    
    func showController(m: Movies) -> UIViewController {
        let c = MovieDetailViewController()
        c.hero.isEnabled = true
        c.setMobie(m: m)
        return c
    }
    
}
