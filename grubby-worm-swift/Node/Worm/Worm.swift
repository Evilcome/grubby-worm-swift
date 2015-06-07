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
    
    override init() {
        locations = []
        
        super.init()
        
        initWorm()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initWorm() {
        
    }
}
