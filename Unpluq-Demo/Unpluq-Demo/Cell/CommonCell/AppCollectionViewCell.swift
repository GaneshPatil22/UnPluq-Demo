//
//  AppCollectionViewCell.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 06/01/23.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "AppCollectionViewCell"

    @IBOutlet weak var appImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpImageView(with name: String) {
        self.appImageView.image = UIImage(systemName: name)
        self.appImageView.tintColor = .black
    }

}
