//
//  MenuViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import UIKit
import EMLEngine

class MenuViewController<T>: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView = UITableView()
    
    internal var items: [T] = []
    
    init(_ items: [T]) {
        super.init(nibName: nil, bundle: nil)
        self.items = items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResusableCell(ofType: UITableViewCell.self, at: indexPath)
        if let school: School = items[indexPath.row] as? School {
            cell.textLabel?.text = school.name
        }
        if let classroom: Classroom = items[indexPath.row] as? Classroom {
            cell.textLabel?.text = classroom.name
        }
        if let meal: Meal = items[indexPath.row] as? Meal {
            cell.textLabel?.text = meal.description
        }
        return cell
    }
}

//MARK: MenuViewController View Setup

extension MenuViewController {
    
    private func setupView() {
        assignTableViewDatasource()
        assignTableViewDelegate()
    }
    
    private func layoutView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func assignTableViewDatasource() {
        self.tableView.dataSource = self
        self.tableView.register(cellClass: UITableViewCell.self)
    }
    
    private func assignTableViewDelegate() {
        self.tableView.delegate = self
    }
}
