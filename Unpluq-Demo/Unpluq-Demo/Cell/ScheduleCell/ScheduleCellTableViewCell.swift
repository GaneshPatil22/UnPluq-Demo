//
//  ScheduleCellTableViewCell.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 05/01/23.
//

import UIKit

class ScheduleCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet var days: [UIView]!
    @IBOutlet weak var appsCollectionView: UICollectionView!

    var blockedApps: [String] = [] {
        didSet {
            self.appsCollectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    private func setUpViews() {
        setUpViewCorners()
        setUpCollectionView()
    }

    private func setUpViewCorners() {
        for v in days {
            v.layer.cornerRadius = 6
        }
        let rand = (0...3).randomElement() ?? 2
        for i in 0...rand {
            let e = 6 - i
            days[e].backgroundColor = .lightGray
        }
        backView.layer.cornerRadius = 10
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


extension ScheduleCellTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
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
