//
//  Playground.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//
import SpriteKit

class Playground : SKNode {
    var size: CGSize {
        didSet {
            drawGrid()
        }
    }

    override var description: String {
        return super.description + " size: {\(size.width), \(size.height)}"
    }
    
    init(size: CGSize) {
        
        // init property
        self.size = size
        
        super.init()
        
        // call method after super init
        self.drawGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawGrid() {
        println(size)
        
        for i in 0...50 {
            
            let node = SKSpriteNode(color: randomColor(luminosity: .Light), size: CGSizeMake(78, 78))
            node.anchorPoint = CGPointZero
            node.position = CGPointZero + CGPoint(x: 80 * i, y: 0)
            
            let changeColor = SKAction.colorizeWithColor(randomColor(luminosity: .Light), colorBlendFactor: 1.0, duration: 2)
            node.runAction(changeColor)
            
            self.addChild(node)
        }
    }
    
}
