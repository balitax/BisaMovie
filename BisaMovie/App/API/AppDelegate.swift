//
//  AppDelegate.swift
//  BisaMovie
//
//  Created by Agus Cahyono on 22/02/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        UINavigationBar.appearance().tintColor = UIColor.defaultTheme
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MovieListRouter.assembleModule()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

