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
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        swipeUp.direction = .Up
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        swipeRight.direction = .Right
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        swipeDown.direction = .Down
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "handleSwipe:")
        swipeLeft.direction = .Left
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
    }
    
    func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        let direction = recognizer.direction
        
        if direction == .Up {
            
        }
        
        if direction == .Right {
            
        }
        
        if direction == .Down {
            
        }
        
        if direction == .Left {
            
        }
    }
}
