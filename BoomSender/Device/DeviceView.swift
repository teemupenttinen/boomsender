//
//  DeviceView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 19.2.2021.
//

import UIKit
import SnapKit

class DeviceView: UIView {
    
    var name: String = ""
    var port: Int = 80
    let CONTROL_OPTIONS = ["TCP", "UDP"]
    var deleteCallback: ((_ idx: Int) -> Void)?
    var addCommandCallback: (() -> Void)?
    
    init() {
        super.init(frame: CGRect.zero)
        
        let nameField = TextFieldWithLabel(label: "Name")
        nameField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            self.name = input.text ?? ""
        }
        
        let controlMethodSelector = SegmentedControlWithLabel(items: CONTROL_OPTIONS, label: "Control method")
        
        let portField = TextFieldWithLabel(label: "Port", keyboardType: .decimalPad)
        portField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            if let port = input.text {
                self.port = Int(port) ?? 0
            }
        }
        
        let collectionView = CollectionView(items: ["Dog", "Cat", "Horse", "Asd", "asf"], title: "Commands")
        collectionView.addCallback = { [weak self] in
            self?.addCommandCallback?()
        }
        
        let saveButton = BasicButton(content: "Save")
        addSubview(nameField)
        addSubview(controlMethodSelector)
        addSubview(portField)
        addSubview(collectionView)
        addSubview(saveButton)

        nameField.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.top.left.right.equalTo(safeAreaLayoutGuide)
        }
        
        controlMethodSelector.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(nameField.snp.bottom).offset(20)
        }
        
        portField.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(controlMethodSelector.snp.bottom).offset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(portField.snp.bottom).offset(20)
            make.bottom.equalTo(saveButton.snp.topMargin)
            make.width.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(50)
        }
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleGesture)))
        
    }
    
    @objc func handleGesture() {
        endEditing(false)
    }
    @objc func controlMethodSelected(_ sender: UISegmentedControl) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
