//
//  MainViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit

final class MainViewController: UIViewController {

    var viewBuilder: ViewBuilderDelegate?
    let tableView = UITableView()
    internal var menu: Menu = MainMenu()
    
    init(_ title: String, with menuItems: [MenuItem] = []) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        menu.addMenuItems(menuItems)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - MainViewController View Setup

extension MainViewController {
    private func setupView() {
        assignTableViewDatasource()
        assignTableViewDelegate()
    }
    
    private func layoutView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}

//MARK: MainViewController - UITableViewDataSource Extension

extension MainViewController: UITableViewDataSource {
    private func assignTableViewDatasource() {
        self.tableView.dataSource = self
        self.tableView.register(cellClass: MenuCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResusableCell(ofType: MenuCell.self, at: indexPath)
        return formatted(cell, for: menu.menuItems[indexPath.row])
    }
    
    private func formatted(_ cell: UITableViewCell, for menuItem: MenuItem) -> UITableViewCell {
        cell.textLabel?.text = menuItem.title
        cell.detailTextLabel?.text = menuItem.description
        return cell
    }
}


//MARK: MainViewController - UITableViewDelegate Extension

extension MainViewController: UITableViewDelegate {
    private func assignTableViewDelegate() {
        self.tableView.delegate = self
    }
}

//MARK: MainViewController - UITableView Navigation Extension

extension MainViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMenuItem = menu.menuItems[indexPath.row]
        viewBuilder?.viewRequest(selectedMenuItem)
    }
}
