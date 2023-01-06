//
//  ScheduleViewController.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class ScheduleViewController: UIViewController {

    let homeTableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = .clear
        tbl.showsHorizontalScrollIndicator = false
        tbl.showsVerticalScrollIndicator = false
        tbl.separatorStyle = .none
        return tbl
    }()

    let createNewSchedule: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: "margels")
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
        btn.setTitle("Create new schedule", for: .normal)
        return btn
    }()

    let data = ["After Work", "Productivity", "Weekend"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()
        self.setUpTableView()
    }

    private func setUpView() {
        view.addSubview(homeTableView)
        view.addSubview(createNewSchedule)
        view.backgroundColor = .black

        homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        createNewSchedule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        createNewSchedule.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        createNewSchedule.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        createNewSchedule.topAnchor.constraint(equalTo: homeTableView.bottomAnchor, constant: 10).isActive = true
        createNewSchedule.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setUpTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = 500
        homeTableView.rowHeight = UITableView.automaticDimension

        homeTableView.register(UINib(nibName: "ScheduleCellTableViewCell",
                                     bundle: nil), forCellReuseIdentifier: "ScheduleCellTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeTableView.reloadData()
    }
}


extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCellTableViewCell", for: indexPath) as! ScheduleCellTableViewCell
        cell.selectionStyle = .none
        cell.titleLabel.text = data[indexPath.row]
        cell.setUpBlockedApps(blockedApps: ["archivebox.circle.fill", "book.circle.fill", "doc.circle.fill", "arrow.up.bin.fill", "arrowshape.turn.up.left.circle.fill", "personalhotspot.circle.fill", "person.fill", "arrow.down.message.fill", "gamecontroller.fill", "archivebox.circle.fill", "book.circle.fill", "doc.circle.fill", "arrow.up.bin.fill"])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
