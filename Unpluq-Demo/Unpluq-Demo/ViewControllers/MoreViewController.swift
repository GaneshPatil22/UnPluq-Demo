//
//  MoreViewController.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class MoreViewController: UIViewController {
    let comingSoonLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura Bold", size: 30)
        lbl.text = "Coming Soon"
        lbl.textAlignment = .center
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpComingSoonLabel()
    }

    private func setUpComingSoonLabel() {
        self.view.addSubview(comingSoonLabel)

        self.comingSoonLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.comingSoonLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.comingSoonLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.comingSoonLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
    }

}
