//
//  DataStruct.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/30.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

enum Direction {
    case East
    case South
    case West
    case North
}

struct Padding {
    var top: CGFloat
    var right: CGFloat
    var bottom: CGFloat
    var left: CGFloat
    
    init(all: CGFloat) {
        top = all
        right = all
        bottom = all
        left = all
    }
    
    init(tb: CGFloat, lr: CGFloat) {
        top = tb
        bottom = tb
        left = lr
        right = lr
    }
}

typealias Margin = Padding

struct Location {
    var row: Int = 0
    var col: Int = 0
}

struct ComboCount {
    var active: Int {
        willSet {
            if newValue >= limit {
                self.active = limit
            } else {
                self.active = newValue
            }
        }
    }
    var limit: Int
}

enum WormStatus {
    case Normal
    case Crazy
}

enum WormType {
    case Normal
    case Grubby
}

struct WormInfo {
    var name: String?
    var speed: NSTimeInterval
    var status: WormStatus
    var type: WormType
}

typealias GridSize = Location





