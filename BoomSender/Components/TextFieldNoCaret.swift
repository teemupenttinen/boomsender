//
//  TextFieldNoCaret.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 23.2.2021.
//

import UIKit

class TextFieldNoCaret: UITextField {
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0.9)
        layer.cornerRadius = 10
    }
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
