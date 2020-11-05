//
//  MoviesTableViewManager.swift
//  MovieAppRedux
//
//  Created by Andrey Petrovskiy on 04.11.2020.
//

import UIKit

protocol DataSource {
    init(tableView: UITableView?)
    func setTableView()
    func update(m: [Movies])
}

class MoviesTableViewManager: NSObject, DataSource {
    private var tableView: UITableView?
    var model: [Movies] = [] {
        didSet{
            tableView?.fadeReload()
        }
    }
    private let cellIdentifier = TVCell.movieCell.indetifier
    func setTableView() {
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.registerCell(cell: .movieCell)
    }
    
    func update(m: [Movies]) {
        self.model = m
    }
    
    required init(tableView: UITableView?) {
        self.tableView = tableView
        
    }
}

extension MoviesTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Height.movieTableView.constant
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainStore.dispatch(RoutingState.detail(model[indexPath.row]))
    }
}
extension MoviesTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MovieCell else {
            return UITableViewCell()
        }
        let m = model[indexPath.row]
        cell.set(m: m)
        return cell
    }
}


