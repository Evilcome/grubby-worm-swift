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
        static let maxComboLimit = 12
    }
    
    var ballSize: CGSize
    var ballWrap: SKSpriteNode
    
    var combo: ComboCount {
        didSet {
            renderBall()
        }
    }
    
    init(combo: ComboCount, max: Int = ComboBarConstants.maxComboLimit) {
        
        let height = UIManager.sharedManager.length(AppTheme.combo_bar_height)
        self.ballSize = CGSizeMake(height, height)
        
        let winWidth = UIManager.sharedManager.winSize.width
        let wrapHeight = UIManager.sharedManager.length(AppTheme.combo_wrap_height)
        let wrapSize = CGSizeMake(winWidth, wrapHeight)
        self.ballWrap = SKSpriteNode(color: AppTheme.combo_bar_color, size: wrapSize)
        
        self.combo = combo
        
        super.init()
        
        renderWrap()
        renderBall()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func upgrade() {
        if combo.limit == ComboBarConstants.maxComboLimit {
            combo.active = combo.limit
        } else {
            combo.active = 1
            combo.limit++
        }
    }
    
    func addActive() {
        combo.active++
    }
    
    func isAllActive() -> Bool {
        return combo.active == combo.limit
    }
    
    func renderWrap() {
        let offsetY = -ballWrap.size.height / 2
        ballWrap.position = CGPointMake(0, offsetY)
        ballWrap.zPosition = 1
        addChild(ballWrap)
        
        // shadow
        let shadow = SKSpriteNode(color: AppTheme.app_main_color, size: ballWrap.size)
        shadow.alpha = 0.25
        shadow.position = ballWrap.position - CGPointMake(0, 0.5)
        
        addChild(shadow)
    }
    
    func renderBall() {
        ballWrap.removeAllChildren()
        
        let offsetX: CGFloat = CGFloat(combo.limit - 1) / 2 * ballSize.width * 1.5
        for i in 0..<combo.limit {
            var ball: SKSpriteNode
            
            if i < combo.active {
                ball = SKSpriteNode(imageNamed: "ball-yellow")
            } else {
                ball = SKSpriteNode(imageNamed: "ball-gray")
            }
            
            let posX = -offsetX + CGFloat(i) * ballSize.width * 1.5
            ball.position = CGPointMake(posX, 0)
            ball.size = ballSize
            
            ballWrap.addChild(ball)
        }
    }
    
}




