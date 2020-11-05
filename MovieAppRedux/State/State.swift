//
//  State.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import ReSwift

struct MainState: StateType {
    var routingState: RoutingState = .start
    var appState: AppState = .loading
}

enum RoutingState: Action {
    case main
    case detail(Movies)
    case pop
    case popToRoot
    case start
}

enum AppState: StateType {
    case loading
    case moviesGetted([Movies])
    case error
}

