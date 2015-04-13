//
//  Playground.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/6.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class Playground : SKNode {
    
    class func countGrid(size: CGSize) -> GridSize {
        var gridSize = GridSize(row: 10, col: 30)
        
        return gridSize
    }
    
    init?(size: CGSize) {
        super.init()
        
        let gridSize = Playground.countGrid(size)
        
        if(gridSize.row == 0 || gridSize.col == 0) {
            return nil
        }
        
        for var i = 0; i < gridSize.row; i++ {
            for var j = 0; j < gridSize.col; j++ {
                let base = SKSpriteNode(imageNamed: "base")
                
                let x = Constants.split * (Float(i)+1) + Constants.bigness * (Float(i)+0.5)
                let y = Constants.split * (Float(j)+1) + Constants.bigness * (Float(j)+0.5)
                
                base.position = CGPointMake(CGFloat(x), CGFloat(y))
                
                base.xScale = 0.4
                base.yScale = 0.4
                let appear = SKAction.scaleTo(1.0, duration: Double(Float(arc4random()) / Float(UINT32_MAX) * 5))
                
                base.runAction(appear)
                
                self.addChild(base)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}