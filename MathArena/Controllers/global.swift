//
//  global.swift
//  MathArena
//
//  Created by adam janusewski on 1/27/22.
//

import Foundation

class Global {
    var name:String
    init(name:String) {
        self.name = name
        var newPoints = 132;
    }
}
var mainInstance = Global(name:"My Global Class")
var newPoints = Global(name:"33")
