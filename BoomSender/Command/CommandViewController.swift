//
//  CommandViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.2.2021.
//

import UIKit

class CommandViewController: UIViewController {

    var saveCallback: ((_ command: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Command"
        
        let commandView = CommandView()

        view.addSubview(commandView)
        
        commandView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        commandView.saveCallback = { [weak self] command in
            self?.saveCallback?(command)
            print(command)
        }
    }
}
