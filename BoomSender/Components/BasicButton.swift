//
//  BasicButton.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 30.1.2021.
//

import UIKit
import SnapKit

class BasicButton: UIButton {
    init(content: String) {
        super.init(frame: .zero)
        
        snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
        }
        
        self.backgroundColor = UIColor.init(red: 184/255, green: 139/255, blue: 74/255, alpha: 1)
        
        self.setTitle(content, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
