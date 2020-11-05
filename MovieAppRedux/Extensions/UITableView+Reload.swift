//
//  UITableView+Reload.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 05.11.2020.
//

import UIKit

extension UITableView {
    func fadeReload() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
            self.reloadData()
        } completion: { (_) in
            UIView.animate(withDuration: 0.5) {
                self.alpha = 1
            }
        }
    }
}

