//
//  MovieView.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

class MovieListView: UIView {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.hero.isEnabled = true
    }
    
    func setDelegate(_ delegate: UITextFieldDelegate?) {
        searchTextField.delegate = delegate
    }
}
