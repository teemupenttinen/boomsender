//
//  ViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var devices: [Device] = [Device(name: "Testi", controlMethod: ControlMethod.TCP, commands: [Command(name: "PowerOn", command: "PowerOff\0a")], port: 9000)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        let homeView = HomeView(devices: devices )
        let deviceViewController = DeviceViewController(device: nil)
        
        deviceViewController.saveNewDevice = { [weak self] device in
            self?.devices.append(device)
            homeView.updateDevices(newDevices: self?.devices ?? [])
        }
            
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        homeView.deleteDeviceCallback = { [weak self] idx in
            guard let self = self else { return }
            self.devices.remove(at: idx)
            homeView.updateDevices(newDevices: self.devices)
        }

        homeView.addDeviceCallback = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(deviceViewController, animated: false)
        }
        
        homeView.editDeviceCallback = { [weak self] idx in
            self?.navigationController?.pushViewController(DeviceViewController(device: self?.devices[idx]), animated: false)
        }
        
    }
}

