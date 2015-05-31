//
//  GameScene.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/15.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var playground: Playground?
    var comboBar: ComboBar?
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
        playground = HarmonyPlayground(size: size)
        comboBar = ComboBar(size: size)
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        playground?.position = center
        addChild(playground!)
        
        let topCenter = center + CGPoint(x: 0, y: frame.midY)
        comboBar?.position = topCenter
        comboBar?.zPosition = 1
        addChild(comboBar!)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(playground)
            
            let grids = playground!.grids
            for grid in grids {
                if grid.containsPoint(location) {
                    let scaleTo = SKAction.scaleTo(0.8, duration: 0.2)
                    scaleTo.timingMode = .EaseInEaseOut
                    
                    grid.runAction(scaleTo)
                }
            }
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let grids = playground!.grids
        for grid in grids {
            if grid.xScale != 1.0 {
                let scaleBack = SKAction.scaleTo(1.0, duration: 0.1)
                grid.removeAllActions()
                grid.runAction(scaleBack)
            }
        }
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        let grids = playground!.grids
        for grid in grids {
            if grid.xScale != 1.0 {
                let scaleBack = SKAction.scaleTo(1.0, duration: 0.1)
                grid.removeAllActions()
                grid.runAction(scaleBack)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
