//
//  Router.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit
import ReSwift

protocol Router {
    func initial()
    func showMovie(m: Movies)
    init(n: UINavigationController?, a: Assembly?)
}

class MoviesRouter: Router, StoreSubscriber {
    
    private var nav: UINavigationController?
    private var a: Assembly?
    
    func initial() {
        if let nav = nav {
            guard let c = a?.initialController() else { return }
            nav.setViewControllers([c], animated: true)
        }
    }
    
    func showMovie(m: Movies) {
        if let nav = nav {
            guard let c = a?.showController(m: m) else { return }
            nav.pushViewController(c, animated: true)
        }
    }
    
    func popToRoot() {
        if let nav = nav {
            nav.popToRootViewController(animated: true)
        }
    }
    
    func pop() {
        if let nav = nav {
            nav.popViewController(animated: true)
        }
    }
    
    required init(n: UINavigationController?, a: Assembly?) {
        self.nav = n
        self.a = a
        self.nav?.setNavigationBarHidden(true, animated: false)
        self.nav?.hero.isEnabled = true
        mainStore.subscribe(self)
    }
    
    func newState(state: MainState) {
        switch state.routingState {
        case .main:
            initial()
        case .detail(let m):
            showMovie(m: m)
        case .pop:
            pop()
        case .popToRoot:
            popToRoot()
        case .start:
            ()
        }
    }
}
