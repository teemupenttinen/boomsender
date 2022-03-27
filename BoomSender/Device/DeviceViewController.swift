//
//  DeviceViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 19.2.2021.
//

import UIKit
import SnapKit

class DeviceViewController: UIViewController {
    
    var commands: [Command] = []
    var editableDevice: Device?
    var saveNewDevice: ((_ device: Device) -> Void)?
    init(device: Device?) {
        super.init(nibName: nil, bundle: nil)
        
        if let d = device {
            editableDevice = d
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Device"
        
        let deviceView = DeviceView(device: editableDevice)
        
        let commandViewController = CommandViewController()
        commandViewController.addNewCommandCallback = { [weak self] command in
            self?.commands.append(command)
            deviceView.collectionView?.items = self?.commands.map { $0.name } ?? []
            deviceView.collectionView?.reloadData()
        }
        
        deviceView.addCommandCallback = { [weak self] in
            self?.navigationController?.pushViewController(commandViewController, animated: false)
        }
        deviceView.save = { [weak self] in
            let newDevice = Device(name: deviceView.name, controlMethod: deviceView.controlMethod, commands: self?.commands ?? [], port: deviceView.port)
            
            if let cb = self?.saveNewDevice {
                self?.navigationController?.popViewController(animated: true)
                cb(newDevice)
            }
        }

        view.addSubview(deviceView)
        
        deviceView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


