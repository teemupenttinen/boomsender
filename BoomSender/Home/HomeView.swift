//
//  HomeView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    var devices: [Device] = []
    var deleteDeviceCallback: ((_ idx: Int) -> Void)?
    var editDeviceCallback: ((_ idx: Int) -> Void)?
    var addDeviceCallback: (() -> Void)?
    var collectionView: CollectionView?
    
    init(devices: [Device]) {
        
        super.init(frame: CGRect.zero)
        self.devices = devices
        collectionView = CollectionView(items: devices.map { $0.name }, title: "Devices", placeholder: "Add your first device!")
        
        collectionView?.addCallback = { [weak self] in
            self?.addDeviceCallback?()
        }
        
        collectionView?.editCallback = { [weak self] idx in
            self?.editDeviceCallback?(idx)
        }
        
        collectionView?.deleteCallback = { [weak self] idx in
            self?.deleteDeviceCallback?(idx)
        }
                
        if let c = collectionView {
            addSubview(c)
        }
        
        collectionView?.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func updateDevices(newDevices: [Device]) {
        collectionView?.items = newDevices.map {$0.name}
        self.devices = newDevices
        collectionView?.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
