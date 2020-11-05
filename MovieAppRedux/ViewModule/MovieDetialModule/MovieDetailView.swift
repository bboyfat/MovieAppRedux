//
//  MovieDetailView.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

class MovieDetailView: UIView {
    @IBOutlet var poster: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var donBtnOutlet: UIButton!
    
    func set(m: Movies?) {
        poster.loadImage(path: m?.poster ?? "")
        title.text = m?.title
    }
    
    func config() {
        poster.layer.cornerRadius = Radius.def
        donBtnOutlet.layer.cornerRadius = Radius.def
    }
}
