//
//  CommandView.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.2.2021.
//

import UIKit
import SnapKit

class CommandView: UIView {
    
    var name = ""
    var command = ""
    var save: ((_ command: Command) -> Void)?
    
    init() {
        super.init(frame: CGRect.zero)
        
        let nameField = TextFieldWithLabel(label: "Name")
        nameField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            self.name = input.text ?? ""
        }
        
        let commandField = TextViewWithLabel(label: "Command")
        commandField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            self.command = input.text ?? ""
        }
        
        let saveButton = BasicButton(content: "Save")
        saveButton.addTarget(self, action: #selector(saveHandler), for: .touchUpInside)
        addSubview(nameField)
        addSubview(commandField)
        addSubview(saveButton)

        nameField.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.top.left.right.equalTo(safeAreaLayoutGuide)
        }
        
        commandField.snp.makeConstraints { (make) in
            make.height.equalTo(200)
            make.width.equalToSuperview()
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(nameField.snp.bottom)
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
        save?(Command(name: name, command: command))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
