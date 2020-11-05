//
//  Reducer.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import ReSwift
import ReSwiftThunk

func appReducer(action: Action, state: MainState?) -> MainState {
    var state = state ?? MainState()
    switch action {
    case let route as RoutingState:
        state.routingState = route
    case let movies as MainActions:
        switch movies {
        case .loadedMovies(let movies):
            state.appState = .moviesGetted(movies)
        case .getMovies(let text):
            Path.searchText = text
            state.appState = .loading
        default:
            ()
        }
    
    default:
        ()
    }
    return state
}




