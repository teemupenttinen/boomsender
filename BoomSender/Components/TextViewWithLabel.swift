//
//  TextViewWithLabel.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.2.2021.
//

import UIKit
import SnapKit

class TextViewWithLabel: UIView {
    
    var textChangedHandler: ((_ sender: UITextView) -> Void)?
    
    init(label: String, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        let textLabel = UILabel()
        textLabel.text = label
        textLabel.textColor = .white
        textLabel.font = textLabel.font?.withSize(22)
        
        let textView = UITextView()
        textView.keyboardType = keyboardType
        textView.layer.cornerRadius = 10
        textView.delegate = self
        textView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0.9)
        textView.font = UIFont.systemFont(ofSize: 18)
        
        let stackView = UIStackView()
        
        stackView.addSubview(textLabel)
        stackView.addSubview(textView)
        addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(15)
        }
        
        textLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
        
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom)
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalToSuperview()
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextViewWithLabel: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        self.textChangedHandler?(textView)
    }
}

