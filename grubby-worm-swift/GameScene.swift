//
//  GameScene.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/15.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        let location = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        let barra = SKShapeNode(rectOfSize: CGSize(width: 64, height: 64))
        barra.name = "test"
        barra.fillColor = SKColor.whiteColor()
        barra.position = location
        
        addChild(barra)
        
        let sprite = SKSpriteNode(imageNamed: "base")
        sprite.position = CGPointMake(location.x + 100, location.y)
        
        addChild(sprite)
        
        let playground = Playground(size: CGSizeZero)
        println(playground)
        
        let pP = PeacefulPlayground(size: CGSizeZero)
        println(pP)
        
        playground.position = location
        addChild(playground)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
//        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"logo")
//            
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
