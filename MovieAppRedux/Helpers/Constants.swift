//
//  Constants.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

enum Height {
    var constant: CGFloat {
        switch self {
        case .movieTableView:
            return UIScreen.main.bounds.height * 0.3
        }
    }
    case movieTableView
}

enum Radius {
    static let def: CGFloat = 10
}

enum HeroID: String {
    case image = "imageID"
    case content = "ContentID"
}
