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
    let CONTROL_OPTIONS = ["TCP", "UDP"]
    
    init() {
        super.init(frame: CGRect.zero)
        
        let nameField = TextFieldWithLabel(label: "Name")
        nameField.textChangedHandler = { [weak self] input in
            guard let self = self else { return }
            self.name = input.text ?? ""
        }
        
       let controlMethodPicker = BottomPicker(label: "Control method", options: CONTROL_OPTIONS)
        
        
        addSubview(nameField)
        addSubview(controlMethodPicker)

        nameField.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.top.left.right.equalTo(safeAreaLayoutGuide)
        }
        
        controlMethodPicker.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(nameField.snp.bottom)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
