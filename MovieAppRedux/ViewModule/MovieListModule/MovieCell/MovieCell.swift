//
//  MovieCell.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var poster: UIImageView!
    @IBOutlet var year: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.hero.isEnabled = true
        poster.layer.cornerRadius = Radius.def
        container.layer.cornerRadius = Radius.def
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(m: Movies) {
        poster.loadImage(path: m.poster ?? "")
        poster.hero.id = HeroID.image.rawValue
        container.hero.id = HeroID.image.rawValue
        year.text = m.year
        title.text = m.title
        type.text = m.type
    }
    
}
