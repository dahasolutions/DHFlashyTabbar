//
//  ViewController.swift
//  DHFlashyTabBarController
//
//  Created by DHs on 04/04/2019.
//  Copyright (c) 2019 DHs. All rights reserved.
//

import UIKit
import DHFlashyTabBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnFromCodePressed(_ sender: AnyObject) {
        let eventsVC = DHSampleViewController()
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: #imageLiteral(resourceName: "Events"), tag: 0)
        let searchVC = DHSampleViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "Search"), tag: 0)
        let activityVC = DHSampleViewController()
        activityVC.tabBarItem = UITabBarItem(title: "Activity", image: #imageLiteral(resourceName: "Highlights"), tag: 0)
        let settingsVC = DHSampleViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "Settings"), tag: 0)
        settingsVC.inverseColor()

        let tabBarController = DHFlashyTabBarController()
        tabBarController.viewControllers = [eventsVC, searchVC, activityVC, settingsVC]
        self.present(tabBarController, animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
