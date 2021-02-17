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
        
        let nav = UINavigationController()
        
        nav.navigationBar.barTintColor = UIColor(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        nav.viewControllers = [HomeViewController()]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

}

