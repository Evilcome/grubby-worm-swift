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
    
    func refect() -> Direction {
        switch self {
        case .East:
            return .West
        case .South:
            return .North
        case .West:
            return .East
        case .North:
            return .South
        default:
            break
        }
    }
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
    
    func up() -> Location {
        return Location(row: self.row, col: self.col + 1)
    }
    
    func down() -> Location {
        return Location(row: self.row, col: self.col - 1)
    }
    
    func left() -> Location {
        return Location(row: self.row - 1, col: self.col)
    }
    
    func right() -> Location {
        return Location(row: self.row + 1, col: self.col)
    }
    
    func up(inRange: GridSizeRange) -> Location {
        if self.col == inRange.to.col {
            return Location(row: self.row, col: inRange.from.col)
        } else {
            return self.up()
        }
    }
    
    func down(inRange: GridSizeRange) -> Location {
        if self.col == inRange.from.col {
            return Location(row: self.row, col: inRange.to.col)
        } else {
            return self.down()
        }
    }
    
    func left(inRange: GridSizeRange) -> Location {
        if self.row == inRange.from.row {
            return Location(row: inRange.to.row, col: self.col)
        } else {
            return self.left()
        }
    }
    
    func right(inRange: GridSizeRange) -> Location {
        if self.row == inRange.to.row {
            return Location(row: inRange.from.row, col: self.col)
        } else {
            return self.right()
        }
    }
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
    var foot: Int
    var status: WormStatus
    var type: WormType
}

typealias GridSize = Location

struct GridSizeRange {
    var from: GridSize
    var to: GridSize
}




