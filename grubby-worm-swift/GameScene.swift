//
//  GameScene.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/15.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var playground: Playground
    
    override init(size: CGSize) {
        self.playground = HarmonyPlayground(size: size)
        
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        let centerPoint = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        playground.position = centerPoint
        
        addChild(playground)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(playground)
            
            let grids = playground.grids
            if grids.count > 0 {
                for grid in grids {
                    if grid.containsPoint(location) {
                        let scaleTo = SKAction.scaleTo(0.8, duration: 0.2)
                        scaleTo.timingMode = .EaseInEaseOut
                        
                        let scaleBack = SKAction.scaleTo(1.0, duration: 0.1)
                        let seq = SKAction.sequence([scaleTo, scaleBack])
                        
//                        let jump = SKAction.jumpToHeight(10, duration: 0.5, originalPosition: grid.position)
                        
                        grid.runAction(seq)
                    }
                }
            }
//            let sprite = SKSpriteNode(imageNamed:"logo")
//            
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
