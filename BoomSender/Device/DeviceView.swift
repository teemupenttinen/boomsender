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
    var controlMethod: ControlMethod = ControlMethod.TCP
    private let CONTROL_OPTIONS = [ControlMethod.TCP, ControlMethod.UDP]
    var deleteCallback: ((_ idx: Int) -> Void)?
    var addCommandCallback: (() -> Void)?
    var save: (() -> Void)?
    
    var collectionView: CollectionView?;
    
    init(device: Device?) {
        super.init(frame: CGRect.zero)
        
        if let d = device {
            name = d.name
            port = d.port
            controlMethod = d.controlMethod
        }
        
        let nameField = TextFieldWithLabel(label: "Name", initialValue: name)
        nameField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            if let text = input.text {
                self.name = text
            }
        }
        
        let controlMethodSelector = SegmentedControlWithLabel(items: CONTROL_OPTIONS.map { $0.rawValue }, label: "Control method")
        controlMethodSelector.changedHandler = { [weak self] input in
            self?.controlMethod = self?.CONTROL_OPTIONS[input.selectedSegmentIndex] ?? ControlMethod.TCP
        }
        
        let portField = TextFieldWithLabel(label: "Port", initialValue: String(port), keyboardType: .decimalPad)
        portField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            if let port = input.text {
                self.port = Int(port) ?? 0
            }
        }
        
        self.collectionView = CollectionView(items: [], title: "Commands")
        self.collectionView?.addCallback = { [weak self] in
            self?.addCommandCallback?()
        }
        
        let saveButton = BasicButton(content: "Save")
        saveButton.addTarget(self, action: #selector(saveHandler), for: .touchUpInside)

        addSubview(nameField)
        addSubview(controlMethodSelector)
        addSubview(portField)
        addSubview(collectionView!)
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
        
        collectionView?.snp.makeConstraints { make in
            make.top.equalTo(portField.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(300)
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
    
    @objc func saveHandler(_ sender: UIButton) {
        save?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
