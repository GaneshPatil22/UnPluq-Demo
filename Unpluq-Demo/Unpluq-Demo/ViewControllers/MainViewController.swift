//
//  MainViewController.swift
//  Unpluq-Demo
//
//  Created by Patil, Ganesh on 04/01/23.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUpTabBar()
        customizeTabBar()
    }

    private func setUpTabBar() {
        let homeVC = getHomeVC()
        let scheduleVC = getScheduleVC()
        let moreVC = getMoreVC()

        self.viewControllers = [homeVC, scheduleVC, moreVC]
    }

    private func customizeTabBar() {
        self.tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.systemPink

        self.tabBarController?.tabBar.backgroundColor = .gray.withAlphaComponent(0.2)

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .gray.withAlphaComponent(0.2)
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }

        tabBar.tintColor = .yellow
        tabBar.unselectedItemTintColor = .white
    }

    private func getHomeVC() -> UIViewController {
        let homeVC = getNavigationController(title: "Home", vc: HomeViewController(), imageName: "house")
        return homeVC
    }

    private func getScheduleVC() -> UIViewController {
        let scheduleVC = getNavigationController(title: "Schedule", vc: ScheduleViewController(), imageName: "calendar")
        return scheduleVC
    }

    private func getMoreVC() -> UIViewController {
        let moreVC = getNavigationController(title: "More", vc: MoreViewController(), imageName: "ellipsis")
        return moreVC
    }

    private func getNavigationController(title: String, vc: UIViewController, imageName: String) -> UIViewController {
        let icon = UIImage(systemName: imageName)
        let navVC = UINavigationController(rootViewController: vc)
        vc.title = title
        vc.tabBarItem.title = title
        vc.tabBarItem.image = icon
        return navVC
    }
}
