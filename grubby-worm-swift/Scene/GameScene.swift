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
    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        
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
        
        playground = HarmonyPlayground(size: size)
        comboBar = ComboBar(combo: ComboCount(active: 0, limit: 6))
        
        let center = CGPoint(x: frame.midX, y: frame.midY)
        playground?.position = center
        addChild(playground!)
        
        let worm = GrubbyWorm()
        playground?.addWorm(worm, location: Location(row: 0, col: 0))
        
        let topCenter = center + CGPoint(x: 0, y: frame.midY)
        comboBar?.position = topCenter
        comboBar?.zPosition = 1
        addChild(comboBar!)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
//        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(playground)
//            
//            if let tiles = playground?.tiles {
//                for tile in tiles {
//                    if tile.containsPoint(location) {
//                        tile.runPressAction()
//                    }
//                }
//            }
//        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
//        if let tiles = playground?.tiles {
//            for tile in tiles {
//                if tile.xScale != 1.0 {
//                    tile.runUpliftAction()
//                }
//            }
//        }
//        
//        if comboBar!.isAllActive() {
//            comboBar?.upgrade()
//        } else {
//            comboBar?.addActive()
//        }
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
//        if let tiles = playground?.tiles {
//            for tile in tiles {
//                if tile.xScale != 1.0 {
//                    tile.runUpliftAction()
//                }
//            }
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        
        var location = recognizer.locationOfTouch(0, inView: view)
        location = self.convertPoint(location, toNode: playground!)
        location = CGPointMake(location.x, -location.y)
        
        var touchTile: Tile?
        if let tiles = playground?.tiles {
            for each in tiles {
    
                if each.containsPoint(location) {
                    touchTile = each
                }
            }
        }
        
        
        let direction = recognizer.direction
        
        if direction == .Up {
            if let tile = touchTile {
                if let tiles = playground?.tilesInDirect(tile, direction: .North) {
                    println("tiles \(tiles.count)")
                    for i in 0..<tiles.count {
                        tiles[i].runSwipeAction(delay: NSTimeInterval(i) * 0.1)
                    }
                }
            }
        }
        
        if direction == .Right {
            println("右")
        }
        
        if direction == .Down {
            println("下")
        }
        
        if direction == .Left {
            println("左")
        }
    }
}
