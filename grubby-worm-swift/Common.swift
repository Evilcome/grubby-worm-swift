//
//  Common.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

enum Direction {
    case East
    case South
    case West
    case North
}

struct Location {
    var row: Int = 0
    var col: Int = 0
}

typealias GridSize = Location

struct Constants {
    static let PlaygroundGridSize = GridSize(row: 32, col: 32)
    static let visibleBlock = 16
    static let blockSplit: CGFloat = 1.2
}




