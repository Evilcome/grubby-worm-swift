//
//  Tile.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/27.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

enum TileStyle {
    case Normal
    case Marble
}

class Tile : SKSpriteNode {
    
    var style: TileStyle = .Normal {
        didSet {
            renderStyle()
        }
    }
    var location: Location
    
    init(location: Location, style: TileStyle = .Normal) {
        self.style = style
        self.location = location
        
        let length = UIManager.sharedManager.length(AppTheme.tile_normal_size)
        let size = CGSizeMake(length, length)
        
        super.init(texture: nil, color: SKColor.clearColor(), size: size)
        
        renderStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func renderStyle() {
        switch style {
        case .Normal:
            self.color = AppTheme.tile_normal_color
            break
        case .Marble:
            self.color = AppTheme.tile_marble_color
            break;
        }
    }
    
    func runPressAction() {
        let scaleTo = SKAction.scaleTo(0.8, duration: 0.2)
        scaleTo.timingMode = .EaseInEaseOut
        
        runAction(scaleTo)
    }
    
    func runUpliftAction() {
        let scaleBack = SKAction.scaleTo(1.0, duration: 0.1)
        removeAllActions()
        runAction(scaleBack)
    }
}
