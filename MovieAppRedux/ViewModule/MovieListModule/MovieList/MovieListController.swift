//
//  MovieListController.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit
import ReSwift

class MovieListController: UIViewController {
    
    private var dataSource: DataSource?
    @IBOutlet var movieListView: MovieListView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListView.setDelegate(self)
        self.hero.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource?.setTableView()
        mainStore.subscribe(self)
        mainStore.dispatch(movieMiddleware)
    }

    public func setDataSource(ds: DataSource?) {
        self.dataSource = ds
    }

}

extension MovieListController: StoreSubscriber {
    func newState(state: MainState) {
        switch state.appState {
        case .loading:
            mainStore.dispatch(movieMiddleware)
        case .moviesGetted(let movies):
            dataSource?.update(m: movies)
        default:
            ()
        }
    }
}

extension MovieListController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainStore.dispatch(MainActions.getMovies(textField.text ?? ""))
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
