//
//  AppDelegate.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Override point for customization after application launch.

        let navigation = UINavigationController(rootViewController: AmiiboViewController())
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        return true
    }

}

