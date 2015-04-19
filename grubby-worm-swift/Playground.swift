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
//            let node = SKSpriteNode(imageNamed: "base")
            let node = SKSpriteNode(color: randomColor(luminosity: .Light), size: CGSizeMake(78, 78))
//            node.xScale = 4.0
            node.yScale = node.xScale
//            node.size = CGSizeMake(78, 78)
//            node.color = randomColor(luminosity: .Light)
            
            node.anchorPoint = CGPointZero
            
            node.position = CGPointZero + CGPoint(x: 80 * i, y: 0)
            
//            let changeColor = SKAction.colorizeWithColor(randomColor(luminosity: .Light), colorBlendFactor: 1.0, duration: 2)
//            node.runAction(changeColor)
            
            let light = SKLightNode()
            node.addChild(light)
            
            light.ambientColor = randomColor(luminosity: .Bright)
            
            self.addChild(node)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
