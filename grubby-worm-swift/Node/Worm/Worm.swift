//
//  Worm.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit
import Foundation

class Worm: SKNode {
    
    weak var playground: Playground?
    var somites: [SKSpriteNode]
    var locations: [Location]
    var info: WormInfo
    var direction: Direction
    var timer: NSTimer?
    
    override init() {
        somites = []
        locations = []
        info = WormInfo(name: "", speed: 0, foot: 0, status: .Normal, type: .Normal)
        direction = .East
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWorm() {
        
    }
    
    func crawl() {
        
    }
    
    func turn(direction: Direction) {
        
    }
    
    func initLocations(location: Location) {
        
    }
    
    func renderNodesPosition() {
        for i in 0..<info.foot {
            if let tile = playground?.tileByLocation(locations[i]) {
                somites[i].position = tile.position
            }
        }
    }
    
    func getNextLocation(now: Location) -> Location {
        switch direction {
        case .East:
            return now.right()
        case .West:
            return now.left()
        case .South:
            return now.down()
        case .North:
            return now.up()
        default:
            break
        }
    }
}
