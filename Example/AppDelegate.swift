//
//  AppDelegate.swift
//  DHFlashyTabBarController
//
//  Created by DHs on 04/04/2019.
//  Copyright (c) 2019 DHs. All rights reserved.
//

import UIKit
import DHFlashyTabBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DHFlashyTabBar.appearance().tintColor = #colorLiteral(red: 0.1176470588, green: 0.1176470588, blue: 0.431372549, alpha: 1)
        DHFlashyTabBar.appearance().barTintColor = .white
        return true
    }
}
