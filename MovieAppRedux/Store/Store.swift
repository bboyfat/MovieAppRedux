//
//  Store.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import ReSwift
import ReSwiftThunk

let movieMiddleWare: Middleware<MainState> = createThunkMiddleware()

let mainStore = Store(
    reducer: appReducer,
    state: nil,
    middleware: [movieMiddleWare],
    automaticallySkipsRepeats: true
)
