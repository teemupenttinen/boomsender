//
//  HomeView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit

class HomeView: UIView {
    
    var devices: [String]
    var deleteCallback: ((_ idx: Int) -> Void)?
    var addDeviceCallback: (() -> Void)?
    var collectionView: UICollectionView?
    
    init(devices: [String]) {
        
        self.devices = devices
        super.init(frame: CGRect.zero)
        
        let stackView = UIStackView()
        let titleStack = UIStackView()
        titleStack.axis = .horizontal
        
        let listTitle = UILabel()
        listTitle.text = "Devices"
        listTitle.textColor = .white
        listTitle.font = listTitle.font.withSize(24)
        
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(addButtonHandler), for: .touchUpInside)
        
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.backgroundColor = UIColor(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.register(DeviceItemCell.self, forCellWithReuseIdentifier: DeviceItemCell.id)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        let centerLabel = UILabel()
        centerLabel.text = "This space is reserved for your devices"
        centerLabel.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        centerLabel.font = centerLabel.font.withSize(24)
        centerLabel.numberOfLines = 0
        centerLabel.textAlignment = .center
        
        titleStack.addSubview(addButton)
        titleStack.addSubview(listTitle)
        //stackView.addSubview(addButton)
        stackView.addSubview(titleStack)
        collectionView?.addSubview(centerLabel)
        
        if let c = collectionView {
            stackView.addSubview(c)
        }
        
        addSubview(stackView)

        listTitle.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(10)
            make.right.equalTo(addButton.snp.left)
        }
        
        addButton.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            make.right.equalToSuperview().inset(10)
        }
        
        titleStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        centerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        collectionView?.snp.makeConstraints { make in
            make.top.equalTo(titleStack.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    func updateDevices(newDevices: [String]) {
        self.devices = newDevices
        collectionView?.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonHandler(_ sender: UIButton) {
        self.addDeviceCallback?()
    }
    
}

class DeviceItemCell: UICollectionViewCell {
    static let id = "DeviceItemCell"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        title.textColor = UIColor.black
        
        self.addSubview(title)
        self.snp.makeConstraints { (make) in
            make.height.equalTo(60).priority(999)
        }
        title.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.centerY.equalToSuperview()
            make.leading.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HomeView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let delete = UIAction(title: "Delete",
            image: UIImage(systemName: "trash.fill"),
            attributes: [.destructive]) { action in
            self.deleteCallback?(indexPath.row)
           }
        
        let edit = UIAction(title: "Edit",
            image: UIImage(systemName: "pencil")) { action in
             print(action)
           }
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) { _ in
            UIMenu(title: "Actions", children: [edit, delete])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeviceItemCell.id, for: indexPath) as? DeviceItemCell else {
            fatalError("failed to dequeue cell with cell id \(DeviceItemCell.id)")
        }
        cell.backgroundColor = .systemBackground
        cell.title.text = devices[indexPath.row]
        return cell
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

