//
//  MiddleTableViewCell.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class MiddleTableViewCell: UITableViewCell {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    private func setUpView() {
        backView.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 20
    }
}
