//
//  ComboBar.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/25.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//
import SpriteKit

struct ComboBarConstants{
    static let defaultCombo = ComboCount(active: 0, limit: 6)
    static let defaultPadding = Padding(all: 10)
    static let maxComboLimit = 12
}

class ComboBar : SKNode {
    
    var size: CGSize
    
    var ballWrap: SKNode
    
    var combo: ComboCount {
        didSet {
            updateView()
        }
    }
    
    init(size: CGSize) {
        self.size = size
        self.ballWrap = SKNode()
        self.combo = ComboBarConstants.defaultCombo
        
        super.init()
        
        updateBoard()
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func upgrade() {
        if combo.limit == ComboBarConstants.maxComboLimit {
//            combo.active = combo.limit
            clean()
        } else {
            combo.active = 1
            combo.limit++
        }
    }
    
    func addActive() {
        combo.active++
    }
    
    func clean() {
        combo = ComboBarConstants.defaultCombo
    }
    
    func isAllActive() -> Bool {
        return combo.active == combo.limit
    }
    
    func updateBoard() {
        let board = SKSpriteNode(color: SKColor.whiteColor(), size: CGSizeMake(size.width, ComboBarConstants.defaultPadding.top * 2))
        addChild(board)
    }

    func updateView() {
        ballWrap.removeAllChildren()
        ballWrap.removeFromParent()
        
        let activeColor = randomColor(hue: .Red, luminosity: .Dark)
        let colorAction = SKAction.colorizeWithColor(activeColor, colorBlendFactor: 1.0, duration: 0.2)
        
        for i in 0..<combo.limit {
            let light = SKSpriteNode(imageNamed: "ball")
            let position = CGPointMake(0 + CGFloat(i) * 36, 0)
            
            if(i < combo.active) {
                light.runAction(colorAction)
            }
            
            light.position = position
            ballWrap.addChild(light)
        }
        
        addChild(ballWrap)
    }
}




