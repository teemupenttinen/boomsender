//
//  AppDelegate.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = RootViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }

}

