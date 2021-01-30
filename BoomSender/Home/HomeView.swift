//
//  HomeView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 29.1.2021.
//

import UIKit

class HomeView: UIView {
    
    var devices: [String]
    
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
        
        titleStack.addSubview(listTitle)
        listTitle.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(100)
            make.left.equalTo(10)
        }
        
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        titleStack.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(100)
            make.right.equalToSuperview().inset(10)
        }
        
        stackView.addSubview(titleStack)
        titleStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }

        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.backgroundColor = UIColor.init(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(DeviceItemCell.self, forCellWithReuseIdentifier: DeviceItemCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let centerLabel = UILabel()
        centerLabel.text = "This space is reserved for your devices"
        centerLabel.textColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        centerLabel.font = centerLabel.font.withSize(24)
        
        collectionView.addSubview(centerLabel)
        
        centerLabel.numberOfLines = 0
        centerLabel.textAlignment = .center
        centerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
        }
        
        stackView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(listTitle.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }

        addSubview(stackView)
        
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
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        title.textColor = UIColor.black

        stackView.addSubview(title)
        
        title.snp.makeConstraints { make in
            
        }
        
        let editButton = UIButton()
        editButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        //editButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        stackView.addSubview(editButton)
        
        editButton.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(50)
            make.right.equalToSuperview().inset(0)
        }
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
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
