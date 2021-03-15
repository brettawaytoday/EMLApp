//
//  MainViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 15/03/21.
//

import UIKit


final class MainViewController: UIViewController {

    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView("Main")
    }
    
    private func setupView(_ title: String) {
        self.title = title
        self.tableView = UITableView()
        assignTableViewDatasource()
        assignTableViewDelegate()
    }
    
    private func layoutView() {
        
    }
}

extension MainViewController: UITableViewDataSource {
    private func assignTableViewDatasource() {
        self.tableView?.dataSource = self
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    private func assignTableViewDelegate() {
        self.tableView?.delegate = self
    }
}
