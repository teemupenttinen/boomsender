//
//  HomeView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit

class HomeView: UIView {
    
    var devices: [String]

    func convertIntRGBAToCGFloat(r: Int, g: Int, b: Int, a: Int) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        return (red: CGFloat(r/255), green: CGFloat(g/255),blue: CGFloat(b/255),alpha: CGFloat(a/255))
    }
    
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
        addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        let bgColor = convertIntRGBAToCGFloat(r: 36, g: 35, b: 49, a: 255)
        config.backgroundColor = UIColor(red: bgColor.red, green: bgColor.green, blue: bgColor.blue, alpha: bgColor.alpha)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(DeviceItemCell.self, forCellWithReuseIdentifier: DeviceItemCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let centerLabel = UILabel()
        centerLabel.text = "This space is reserved for your devices"
        centerLabel.textColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        centerLabel.font = centerLabel.font.withSize(24)
        centerLabel.numberOfLines = 0
        centerLabel.textAlignment = .center
        
        titleStack.addSubview(listTitle)
        titleStack.addSubview(addButton)
        stackView.addSubview(titleStack)
        collectionView.addSubview(centerLabel)
        stackView.addSubview(collectionView)
        addSubview(stackView)
        
        listTitle.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(100)
            make.left.equalTo(10)
        }
        
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(100)
            make.right.equalToSuperview().inset(10)
        }
        
        titleStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
        
        centerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(listTitle.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        print(sender)
    }
    
}

class DeviceItemCell: UICollectionViewCell {
    static let id = "DeviceItemCell"
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        title.textColor = UIColor.black

        addSubview(title)
        self.snp.makeConstraints { (make) in
            make.height.equalTo(60)
        }
        
        title.snp.makeConstraints { make in
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
            print(indexPath.row)
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
        print(indexPath.row)
        //self.openDetails(indexPath.row)
    }
}

