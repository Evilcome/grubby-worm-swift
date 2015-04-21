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
        
        let gridSize = Constants.PlaygroundGridSize
        
        let unit = CGFloat(size.width - 2.0) / CGFloat(gridSize.col) - 2.0
        
        let node = SKSpriteNode(color: randomColor(luminosity: .Dark), size: CGSizeMake(unit, unit))
        
        for var i = 0; i != gridSize.row; i++ {
            for var j = 0; j != gridSize.col; j++ {
                
                let grid = node.copy() as! SKSpriteNode
                
                let posX = CGFloat(2 * (i + 1)) + unit * (CGFloat(i) + 0.5)
                let posY = CGFloat(2 * (j + 1)) + unit * (CGFloat(j) + 0.5)
                
                grid.position = CGPointMake(posX, posY)
                
                addChild(grid);
            }
        }
        
        let point = SKSpriteNode(color: SKColor.blackColor(), size: CGSizeMake(5, 5))
        point.position = CGPointZero
        addChild(point)
        
//        for i in 0...50 {
//            
//            let node = SKSpriteNode(color: randomColor(luminosity: .Light), size: CGSizeMake(78, 78))
//            node.anchorPoint = CGPointZero
//            node.position = CGPointZero + CGPoint(x: 80 * i, y: 0)
//            
//            let changeColor = SKAction.colorizeWithColor(randomColor(luminosity: .Light), colorBlendFactor: 1.0, duration: 2)
//            node.runAction(changeColor)
//            
//            self.addChild(node)
//        }
    }
    
}
