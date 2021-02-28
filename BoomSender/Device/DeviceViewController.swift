//
//  DeviceViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 19.2.2021.
//

import UIKit
import SnapKit

class DeviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Device"
        
        let deviceView = DeviceView()

        view.addSubview(deviceView)
        
        deviceView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        deviceView.addCommandCallback = { [weak self] in
            self?.navigationController?.pushViewController(CommandViewController(), animated: false)
        }
        
    }
}


