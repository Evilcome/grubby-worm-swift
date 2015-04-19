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
        
        
        for i in 0...16 {
            let node = SKShapeNode(rectOfSize: CGSizeMake(32, 32))
            node.fillColor = randomColor(hue: .Blue, luminosity: .Light)
            node.position = CGPointZero + CGPoint(x: 34 * i, y: 0)
            node.strokeColor = node.fillColor
            
            self.addChild(node)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
