//
//  DHTabItemAnimation.swift
//  DHFlashyTabBarController
//
//  Created by DHs on 04/04/2019.
//  Copyright © 2019 DHs. All rights reserved.
//

import Foundation

protocol DHTabItemAnimation {

    func playAnimation(forTabBarItem item: DHTabBarButton)
    func playAnimation(forTabBarItem item: DHTabBarButton, completion: (() -> Void)?)

}

extension DHTabItemAnimation {

    func playAnimation(forTabBarItem item: DHTabBarButton) {
        playAnimation(forTabBarItem: item, completion: nil)
    }

}
