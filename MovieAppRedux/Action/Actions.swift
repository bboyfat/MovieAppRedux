//
//  Actions.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import ReSwift

enum MainActions: Action {
    case getMovies(String)
    case route(RoutingState)
    case loadedMovies([Movies])
    case showMovie(Movies)
}
