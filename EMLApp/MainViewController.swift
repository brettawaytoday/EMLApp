//
//  MainViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit


final class MainViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView("Main")
    }
    
    private func setupView(_ title: String) {
        self.title = title
        assignTableViewDatasource()
        assignTableViewDelegate()
        layoutView()
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
        self.tableView.register(cellClass: UITableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
