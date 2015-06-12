//
//  GameScene.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/15.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, UIGestureRecognizerDelegate {
    var playground: Playground?
    var comboBar: ComboBar?
    var targetWorm: Worm?
    
    var panStartPos = CGPointZero
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        addSwipeGestureRecognizer(view)
        
        playground = HarmonyPlayground(size: size)
        comboBar = ComboBar(combo: ComboCount(active: 0, limit: 6))
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        playground?.position = center
        addChild(playground!)
        
        let worm = GrubbyWorm()
        playground?.addWorm(worm, location: Location(row: 0, col: 0))
        targetWorm = worm
        
        let topCenter = center + CGPoint(x: 0, y: frame.midY)
        comboBar?.position = topCenter
        comboBar?.zPosition = 1
        addChild(comboBar!)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func addSwipeGestureRecognizer(view: SKView) {
        let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        view.addGestureRecognizer(panGesture)
    }
    
    func handlePan(sender: UIPanGestureRecognizer) {
        if sender.state == .Began {
            panStartPos = sender.locationInView(view)
        }
        
        if sender.state == .Ended {
            let offsetPos = sender.locationInView(view) - panStartPos
            if offsetPos.length() > 15 {
                let angle = offsetPos.angle
                
                // right -π/6 ~ π/6
                if angle >= -π/6 && angle <= π/6 {
                    targetWorm?.turn(.East)
                }
                
                // up
                if angle <= -π*2/6 && angle >= -π*4/6 {
                    targetWorm?.turn(.North)
                }
                
                // left
                if angle <= -π*5/6 || angle >= π*5/6 {
                    targetWorm?.turn(.West)
                }
                
                // down
                if angle <= π*4/6 && angle >= π*2/6 {
                    targetWorm?.turn(.South)
                }
            }
        }
    }
}
