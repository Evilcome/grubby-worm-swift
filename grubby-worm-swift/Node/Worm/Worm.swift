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
    var locations: [Location]
    var info: WormInfo
    var direction: Direction
    
    override init() {
        locations = []
        info = WormInfo(name: "", speed: 0, status: .Normal, type: .Normal)
        direction = .East
        
        super.init()
        
        initWorm()
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
}
