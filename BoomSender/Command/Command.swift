//
//  Command.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 26.3.2022.
//

import Foundation

struct Command {
    var name: String
    var command: String
    
    init(name: String, command: String) {
        self.name = name
        self.command = command
    }
}
