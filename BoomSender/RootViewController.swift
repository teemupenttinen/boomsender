//
//  RootViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//
import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        navigationBar.barTintColor = UIColor.init(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        viewControllers = [HomeViewController()]
    }


}


