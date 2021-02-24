//
//  ViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var devices = ["Projector 1", "Projector 2", "TV 1", "TV 2", "Switcher 1", "Switcher 2", "Audio Processor 1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        let homeView = HomeView(devices: devices )

        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        homeView.deleteCallback = { [weak self] idx in
            guard let self = self else { return }
            self.devices.remove(at: idx)
            homeView.updateDevices(newDevices: self.devices)
        }
        
        homeView.addDeviceCallback = { [weak self] in
            guard let self = self else { return }
            print("ASD")
            self.navigationController?.pushViewController(DeviceViewController(), animated: false)
        }
        
    }
}

