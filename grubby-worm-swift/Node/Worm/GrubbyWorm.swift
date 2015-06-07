//
//  GrubbyWorm.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GrubbyWorm: Worm {
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initWorm() {
        let length = UIManager.sharedManager.length(AppTheme.grubby_worm_height)
        let somiteSize = CGSizeMake(length, length)
        for i in 0..<5 {
            let node = SKSpriteNode(color: AppTheme.app_main_color, size: somiteSize)
            addChild(node)
        }
    }
}
