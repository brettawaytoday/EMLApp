//
//  ReportViewController.swift
//  EMLApp
//
//  Created by Brett Christian on 16/03/21.
//

import UIKit
import EMLEngine

class ReportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var reports: [Report] = []
    
    var tableView = UITableView()
    
    init(reports: [Report]) {
        super.init(nibName: nil, bundle: nil)
        self.reports = reports
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.title = "Report"
        setupView()
        layoutView()
        print(reports.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let report = reports[section]
        return report.subReports.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        reports.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(reports[section].title) - \(reports[section].search(for: .meal).count) meals"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResusableCell(ofType: UITableViewCell.self, at: indexPath)
        return populate(cell, with: reports[indexPath.section].subReports[indexPath.row])
    }
    
    private func populate<T>(_ cell: UITableViewCell, with item: T) -> UITableViewCell {
        switch item {
        case let (schoolReport as SchoolReport) where item is SchoolReport:
            cell.textLabel?.text = schoolReport.title
        case let (classroomReport as ClassroomReport) where item is ClassroomReport:
            cell.textLabel?.text = classroomReport.title
        case let (meal as MealReport) where item is MealReport:
            cell.textLabel?.text = meal.title
        case let (packagingReport as PackagingReport) where item is PackagingReport:
            cell.textLabel?.text = packagingReport.title
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
}


extension ReportViewController {
    
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
        tableView.dataSource = self
        tableView.register(cellClass: UITableViewCell.self)
    }
    
    private func assignTableViewDelegate() {
        self.tableView.delegate = self
    }
    
}
