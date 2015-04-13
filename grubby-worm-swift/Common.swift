//
//  Common.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/6.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

enum Direction {
    case North, South, East, West
}

struct GridSize {
    var row:Int = 0
    var col:Int = 0
}

struct Constants {
    static let split:Float = 4.0
    static let bigness:Float = 32.0
}

// Type Struct
