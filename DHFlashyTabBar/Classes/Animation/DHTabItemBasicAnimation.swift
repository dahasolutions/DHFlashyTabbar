//
//  DHTabItemBasicAnimation.swift
//  DHFlashyTabBarController
//
//  Created by DHs on 04/04/2019.
//  Copyright © 2019 DHs. All rights reserved.
//

import UIKit

protocol DHTabItemBasicAnimation: DHTabItemAnimation {

    func imageOffsetAnimation(forTabBarItem item: DHTabBarButton) -> CAAnimation
    func imageMaskAnimation(forTabBarItem item: DHTabBarButton) -> CAAnimation
    func labelOffsetAnimation(forTabBarItem item: DHTabBarButton) -> CAAnimation
    func labelMaskAnimation(forTabBarItem item: DHTabBarButton) -> CAAnimation
    func dotScaleAnimation(forTabBarItem item: DHTabBarButton) -> CAAnimation

    var duration: Double { get }

}

extension DHTabItemBasicAnimation {

    func playAnimation(forTabBarItem item: DHTabBarButton, completion: (() -> Void)? = nil) {
        let animateImageOffset = imageOffsetAnimation(forTabBarItem: item)
        let animateImageMask = imageMaskAnimation(forTabBarItem: item)
        animateImageMask.isRemovedOnCompletion = false

        let animateLabelOffset = labelOffsetAnimation(forTabBarItem: item)
        let animateLabelMask = labelMaskAnimation(forTabBarItem: item)
        animateLabelMask.isRemovedOnCompletion = false

        let dotAnimation = dotScaleAnimation(forTabBarItem: item)

        let mainAnimations: [CAAnimation] = [animateImageOffset,
                                             animateImageMask,
                                             animateLabelOffset,
                                             animateLabelMask,
                                             dotAnimation]
        mainAnimations.forEach { (animation) in
            animation.duration = duration
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
        }
        if item.tabImage.layer.mask == nil {
            let imageMask = CAShapeLayer()
            imageMask.frame = item.tabImage.bounds
            item.tabImage.layer.mask = imageMask
        }

        if let animateImageMask = animateImageMask as? CAKeyframeAnimation,
           let imageMask = item.tabImage.layer.mask as? CAShapeLayer {
            imageMask.path = (animateImageMask.values as? [CGPath])?.last
        }

        if item.tabLabel.layer.mask == nil {
            let labelMask = CAShapeLayer()
            labelMask.frame = item.tabLabel.bounds
            item.tabLabel.layer.mask = labelMask
        }

        if let animateLabelMask = animateLabelMask as? CAKeyframeAnimation,
           let labelMask = item.tabLabel.layer.mask as? CAShapeLayer {
            labelMask.path = (animateLabelMask.values as? [CGPath])?.last
        }

        let timing = CAMediaTimingFunction(name: .easeOut)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timing)
        CATransaction.setCompletionBlock { completion?() }
        item.tabImage.layer.add(animateImageOffset, forKey: "offset")
        item.tabLabel.layer.add(animateLabelOffset, forKey: "offset")
        item.dotView.layer.add(dotAnimation, forKey: "scale")
        item.tabImage.layer.mask?.add(animateImageMask, forKey: "path")
        item.tabLabel.layer.mask?.add(animateLabelMask, forKey: "path")
        CATransaction.commit()
    }

}
