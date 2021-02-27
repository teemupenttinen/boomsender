//
//  HomeView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit

class HomeView: UIView {
    
//    var devices: [String]
//    var deleteCallback: ((_ idx: Int) -> Void)?
//    var addDeviceCallback: (() -> Void)?
//    var collectionView: UICollectionView?
    
    init(devices: [String]) {
        
//        self.devices = devices
        super.init(frame: CGRect.zero)
        
//        let stackView = UIStackView()
//        let titleStack = UIStackView()
//        titleStack.axis = .horizontal
//
//        let listTitle = UILabel()
//        listTitle.text = "Devices"
//        listTitle.textColor = .white
//        listTitle.font = listTitle.font.withSize(24)
//
//        let centerLabel = UILabel()
//        centerLabel.text = "This space is reserved for your devices"
//        centerLabel.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
//        centerLabel.font = centerLabel.font.withSize(24)
//        centerLabel.numberOfLines = 0
//        centerLabel.textAlignment = .center
//
//        //collectionView?.addSubview(centerLabel)
//
//        if let c = collectionView {
//            stackView.addSubview(c)
//        }
//
//        addSubview(stackView)

       
        
//        centerLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalToSuperview().dividedBy(1.5)
//        }
        
//        collectionView?.snp.makeConstraints { make in
//            make.top.equalTo(titleStack.snp.bottom)
//            make.bottom.equalToSuperview()
//            make.width.equalToSuperview()
//        }
        
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        
    }
    
//    func updateDevices(newDevices: [String]) {
//        self.devices = newDevices
//        collectionView?.reloadData()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func addButtonHandler(_ sender: UIButton) {
//        self.addDeviceCallback?()
//    }
//
}
