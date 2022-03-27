//
//  File.swift
//  BoomSender
//
//  Created by Teemu Penttinen on 27.3.2022.
//

import Foundation

enum ControlMethod : String {
   case TCP = "TCP", UDP = "UDP"
}

struct Device {
    let name: String
    let controlMethod: ControlMethod
    let commands: [Command]
    let port: Int
}
