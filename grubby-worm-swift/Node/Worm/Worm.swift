//
//  Worm.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class Worm: SKNode {
    
    weak var playground: Playground?
    var locations: [Location]
    var info: WormInfo
    
    override init() {
        locations = []
        info = WormInfo(name: "", speed: 0, status: .Normal, type: .Normal)
        
        super.init()
        
        initWorm()
        crawl()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWorm() {
        
    }
    
    func crawl() {
        
    }
}
