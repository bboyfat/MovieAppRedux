//
//  MovieDetailViewController.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit
import Hero

class MovieDetailViewController: UIViewController {
    
    @IBOutlet var detailView: MovieDetailView!
    private var m: Movies?
    
    public func setMobie(m: Movies) {
        self.m = m
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        detailView.poster.hero.id = HeroID.image.rawValue
        detailView.donBtnOutlet.hero.id = HeroID.content.rawValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailView.set(m: m)
        detailView.config()
    }
    @IBAction func doneBtnAction(_ sender: Any) {
        mainStore.dispatch(RoutingState.pop)
    }
    
     
}
