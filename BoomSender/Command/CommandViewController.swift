//
//  CommandViewController.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.2.2021.
//

import UIKit

class CommandViewController: UIViewController {

    var addNewCommandCallback: ((_ command: Command) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Command"
        
        let commandView = CommandView()
        commandView.save = { [weak self] command in
            self?.addNewCommandCallback?(command)
            self?.navigationController?.popViewController(animated: true)
        }

        view.addSubview(commandView)
        
        commandView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
