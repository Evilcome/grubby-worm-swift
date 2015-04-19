//
//  Playground.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//
import SpriteKit

class Playground : SKNode {
    var size: CGSize

    override var description: String {
        return super.description + " size: {\(size.width), \(size.height)}"
    }
    
    init(size: CGSize) {
        self.size = size
        
        super.init()
        
        
        for i in 0...50 {
            let node = SKSpriteNode(imageNamed: "base")
            
            node.position = CGPointZero + CGPoint(x: 34 * i, y: 0)
            
            self.addChild(node)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
