//
//  MainViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit

final class MainViewController: UIViewController {

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self)
        cell.textLabel?.text = menu.menuItems[indexPath.row].title
        return cell
    }
}


//MARK: MainViewController - UITableViewDelegate Extension

extension MainViewController: UITableViewDelegate {
    private func assignTableViewDelegate() {
        self.tableView.delegate = self
    }
}
