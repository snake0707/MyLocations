//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by snake on 15/7/29.
//  Copyright (c) 2015年 snakeLib. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return nil
    }
}
