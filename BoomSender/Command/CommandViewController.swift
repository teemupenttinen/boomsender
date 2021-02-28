//
//  CommandViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.2.2021.
//

import UIKit

class CommandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Command"
        
        let commandView = CommandView()

        view.addSubview(commandView)
        
        commandView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
