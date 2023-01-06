//
//  TopTableViewCell.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class TopTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundCustomView: UIView!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    @IBOutlet weak var btn: UIButton!

    var blockedApps: [String] = [] {
        didSet {
            self.appsCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    private func setUpView() {
        setUpViewCorners()
        setUpCollectionView()
    }

    private func setUpViewCorners() {
        self.btn.layer.cornerRadius = 20
        self.backgroundCustomView.layer.cornerRadius = 10
    }

    private func setUpCollectionView() {
        appsCollectionView.register(UINib(nibName: AppCollectionViewCell.cellIdentifier, bundle: nil),
                                    forCellWithReuseIdentifier: AppCollectionViewCell.cellIdentifier)

        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        appsCollectionView.collectionViewLayout = layout

        appsCollectionView.showsHorizontalScrollIndicator = false
    }

    func setUpBlockedApps(blockedApps: [String]) {
        self.blockedApps = blockedApps
    }
}

extension TopTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.blockedApps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCollectionViewCell.cellIdentifier, for: indexPath) as! AppCollectionViewCell
        cell.setUpImageView(with: self.blockedApps[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }

}
