//
//  UITableView+Register.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

extension UITableView {
    func registerCell(cell: TVCell) {
        let nib = UINib(nibName: cell.nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cell.indetifier)
    }
}
