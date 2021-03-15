//
//  MainViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit

struct MenuItem{
    var title: String
    var description: String
}

protocol Menu {
    var menuItems: [MenuItem] { get }
    mutating func addMenuItem(_ menuItem: MenuItem)
}

struct MainMenu: Menu {
    var menuItems: [MenuItem] = []
    
    mutating func addMenuItem(_ menuItem: MenuItem) {
        menuItems.append(menuItem)
    }
}

final class MainViewController: UIViewController {

    let tableView = UITableView()
    internal var menu: Menu = MainMenu()
    
    init(_ title: String, with menuItems: [MenuItem] = []) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        menuItems.forEach { menu.addMenuItem($0) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
    }
    
    private func setupView() {
        assignTableViewDatasource()
        assignTableViewDelegate()
    }
    
    private func layoutView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: MainViewController - UITableViewDataSource Extension

extension MainViewController: UITableViewDataSource {
    private func assignTableViewDatasource() {
        self.tableView.dataSource = self
        self.tableView.register(cellClass: UITableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        return cell
    }
}


//MARK: MainViewController - UITableViewDelegate Extension

extension MainViewController: UITableViewDelegate {
    private func assignTableViewDelegate() {
        self.tableView.delegate = self
    }
}
