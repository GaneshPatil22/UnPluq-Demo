//
//  HomeViewController.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    let homeTableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.backgroundColor = .clear
        tbl.showsHorizontalScrollIndicator = false
        tbl.showsVerticalScrollIndicator = false
        tbl.separatorStyle = .none
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpTableView()
    }

    private func setUpView() {
        view.addSubview(homeTableView)
        view.backgroundColor = .black

        homeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setUpTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.estimatedRowHeight = 500
        homeTableView.rowHeight = UITableView.automaticDimension

        homeTableView.register(UINib(nibName: "TopTableViewCell",
                                     bundle: nil), forCellReuseIdentifier: "TopTableViewCell")
        homeTableView.register(UINib(nibName: "MiddleTableViewCell",
                                     bundle: nil), forCellReuseIdentifier: "MiddleTableViewCell")
        homeTableView.register(UINib(nibName: "BottomTableViewCell",
                                     bundle: nil), forCellReuseIdentifier: "BottomTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeTableView.reloadData()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as! TopTableViewCell
            cell.selectionStyle = .none
            cell.setUpBlockedApps(blockedApps: ["archivebox.circle.fill", "book.circle.fill", "doc.circle.fill", "arrow.up.bin.fill", "arrowshape.turn.up.left.circle.fill", "personalhotspot.circle.fill", "person.fill", "arrow.down.message.fill", "gamecontroller.fill", "archivebox.circle.fill", "book.circle.fill", "doc.circle.fill", "arrow.up.bin.fill"])
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MiddleTableViewCell", for: indexPath) as! MiddleTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BottomTableViewCell", for: indexPath) as! BottomTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
