//
//  TextFieldWithLabel.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 19.2.2021.
//

import UIKit
import SnapKit

class TextFieldWithLabel: UIView {
    
    var textChangedHandler: ((_ sender: UITextField) -> Void)?

    init(label: String) {
        super.init(frame: .zero)
        
        let textLabel = UILabel()
        textLabel.text = label
        textLabel.textColor = .white
        let textField = TextField()
        
        let stackView = UIStackView()
        
        stackView.addSubview(textLabel)
        stackView.addSubview(textField)
        addSubview(stackView)
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        textLabel.font = textLabel.font.withSize(22)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(15)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.5)
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom).offset(10)
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalToSuperview()
        }

    }
    
    @objc func textChanged(_ textField: UITextField) {
        textChangedHandler?(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
