//
//  ComboBar.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/25.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//
import SpriteKit

class ComboBar : SKNode {
    
    struct ComboBarConstants {
        static let defaultCombo = ComboCount(active: 0, limit: 6)
        static let defaultPadding = Padding(all: 10)
        static let maxComboLimit = 12
    }
    
    var size: CGSize
    var ballSize: CGSize
    
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
        
        let height = UIManager.sharedManager.length(AppTheme.combo_bar_height)
        self.ballSize = CGSizeMake(height, height)
        
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
        let board = SKSpriteNode(color: SKColor.whiteColor(), size: CGSizeMake(size.width, ComboBarConstants.defaultPadding.top * 2 + ballSize.height))
        addChild(board)
    }

    func updateView() {
        ballWrap.removeAllChildren()
        ballWrap.removeFromParent()
        
        let x = CGFloat(Int(combo.limit / 2))
        let y = CGFloat(combo.limit % 2)
        let split = 1.5 * ballSize.width
        var offsetX = 1.5 * ballSize.width * x
        offsetX += split * (x + y * 0.5 - 0.5)
        let posY = -ballSize.height / 2 + ComboBarConstants.defaultPadding.top / 2
        for i in 0..<combo.limit {
            var light: SKSpriteNode
            let posX = -offsetX / 2 + CGFloat(i) * split
            let position = CGPointMake(posX, posY)
            
            if(i < combo.active) {
                light = SKSpriteNode(imageNamed: "ball-yellow")
            } else {
                light = SKSpriteNode(imageNamed: "ball-gray")
            }
    
            light.size = ballSize
            light.position = position
            ballWrap.addChild(light)
        }
        
        addChild(ballWrap)
    }
    
    func shake(ball: SKSpriteNode) {
        
    }
}




