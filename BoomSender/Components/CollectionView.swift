//
//  CollectionView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 25.2.2021.
//

import UIKit

class CollectionView: UIView {
    
    var items: [String] = []
    var placeholderItem: String?
    var deleteCallback: ((_ idx: Int) -> Void)?
    var addCallback: (() -> Void)?
    var editCallback: ((_ idx: Int) -> Void)?
    var collectionView: UICollectionView?
    init(items: [String], title: String) {
        
        super.init(frame: .zero)
        self.items = items
        setupView(title: title)
    }
    
    init(items: [String], title: String, placeholder: String) {
        super.init(frame: .zero)
        self.items = items
        self.placeholderItem = placeholder
        setupView(title: title)
    }
    
    func setupView(title: String) {
        let titleStack = UIStackView()
        titleStack.axis = .horizontal
        
        let listTitle = UILabel()
        listTitle.text = title
        listTitle.textColor = .white
        listTitle.font = listTitle.font.withSize(24)
        
        let addButton = UIButton()
        addButton.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        addButton.tintColor = .white
        addButton.addAction(UIAction() { [weak self] _ in
            self?.addCallback?()
        }, for: .touchUpInside)
        
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        config.backgroundColor = UIColor(red: 36/255, green: 35/255, blue: 49/255, alpha: 1)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView?.register(DeviceItemCell.self, forCellWithReuseIdentifier: DeviceItemCell.id)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        titleStack.addArrangedSubview(listTitle)
        titleStack.addArrangedSubview(addButton)
        
        addSubview(titleStack)
        
        if let c = collectionView {
            addSubview(c)
        }
       
        listTitle.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.left.equalTo(15)
        }
        
        addButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalToSuperview()
            make.right.equalTo(10)
        }
        
        titleStack.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        collectionView?.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.top.equalTo(titleStack.snp.bottom)
        }
    }
    
    func reloadData() {
        collectionView?.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


extension CollectionView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items.count == 0 && placeholderItem != nil {
            return 1
        }
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let delete = UIAction(title: "Delete",
                              image: UIImage(systemName: "trash.fill"),
                              attributes: [.destructive]) { action in
            self.deleteCallback?(indexPath.row)
        }
        
        let edit = UIAction(title: "Edit",
                            image: UIImage(systemName: "pencil")) { action in
            self.editCallback?(indexPath.row)
        }
        
        if items.count > 0 {
            return UIContextMenuConfiguration(identifier: nil,
                                              previewProvider: nil) { _ in
                UIMenu(title: "Actions", children: [edit, delete])
            }
        }
       return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeviceItemCell.id, for: indexPath) as? DeviceItemCell else {
            fatalError("failed to dequeue cell with cell id \(DeviceItemCell.id)")
        }
        
        cell.backgroundColor = .white
        
        if items.count == 0 && placeholderItem != nil {
            cell.title.text = placeholderItem
        }
        else {
            cell.title.text = items[indexPath.row]
        }
        
        return cell
    }
}

extension CollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
