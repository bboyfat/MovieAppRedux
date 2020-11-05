//
//  UIImageView + Load.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import Nuke
import UIKit

extension UIImageView {
    func loadImage(path: String) {
        guard let url = URL(string: path) else {
            return
        }
        Nuke.loadImage(with: url, into: self)
    }
}
