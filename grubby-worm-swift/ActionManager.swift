//
//  ActionManager.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/31.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

class ActionManager {
    
    private static let sharedInstance = ActionManager()
    
    class var sharedManager: ActionManager {
        return sharedInstance
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
    
    //                        let scaleBack = SKAction.scaleTo(1.0, duration: 0.1)
    //                        let seq = SKAction.sequence([scaleTo, scaleBack])
    
    //                        let jump = SKAction.jumpToHeight(10, duration: 0.5, originalPosition: grid.position)
}
