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
        let shaderContainer_move = SKSpriteNode(imageNamed: "dummypixel")
        shaderContainer_move.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        shaderContainer_move.size = CGSizeMake(self.frame.size.width, self.frame.size.height)
        
        addChild(shaderContainer_move)
        
        let shader_move = SKShader(fileNamed: "shader_water_movement.fsh")
        //Set vairiables that are used in the shader script
        shader_move.uniforms = [
            SKUniform(name: "size", floatVector3: GLKVector3Make(Float(frame.size.width)*1.5, Float(frame.height)*1.5, 0)),
            SKUniform(name: "customTexture", texture: SKTexture(imageNamed: "sand"))
        ]
        //add the shader to the sprite
        shaderContainer_move.shader = shader_move
        
        let shaderContainer_reflect = SKSpriteNode(imageNamed: "dummypixel")
        shaderContainer_reflect.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        shaderContainer_reflect.size = CGSizeMake(self.frame.size.width, self.frame.size.height)
        addChild(shaderContainer_reflect)
        
        let shader_reflect = SKShader(fileNamed: "shader_water_reflection.fsh")
        //Set vairiables that are used in the shader script
        shader_reflect.uniforms = [
            SKUniform(name: "size", floatVector3: GLKVector3Make(Float(frame.size.width), Float(frame.height), 0)),
        ]
        //add the shader to the sprite
        shaderContainer_reflect.shader = shader_reflect
        
        let beach = SKSpriteNode(imageNamed: "beach")
        beach.size = self.size
        beach.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100)
        
        addChild(beach)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"bk")
            
            sprite.xScale = 0.5 + 2 * CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            sprite.yScale = sprite.xScale
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
