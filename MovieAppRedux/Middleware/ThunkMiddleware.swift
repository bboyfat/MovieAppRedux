//
//  ThunkMiddleware.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import ReSwift
import ReSwiftThunk
import Foundation

let movieMiddleware = Thunk<MainState> { dispatch, getState in
    guard let state = getState() else { return }
    switch state.appState {
    case.moviesGetted(let m):
        return
    case .loading:
        MovieClient().fetchMovies { (movies) in
            DispatchQueue.main.async {
                dispatch(MainActions.loadedMovies(movies))
            }
        }
    default:
        break
    }
    
}
