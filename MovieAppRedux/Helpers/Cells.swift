//
//  Cells.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit


enum TVCell {
    
    case movieCell
    
    var indetifier: String {
        switch self {
        case .movieCell:
            return "movieCell"
        }
    }
    
    var nibName: String {
        switch self {
        case .movieCell:
            return "MovieCell"
        }
    }
    
}
