//
//  UIManager.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/30.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class UIManager {
    
    private static let sharedInstance = UIManager()
    
    class var sharedManager: UIManager {
        return sharedInstance
    }
    
    var unit: CGFloat = 0
    var winSize: CGSize = CGSizeZero
    
    func parseUnit(window: UIWindow) {
        winSize = window.frame.size
        unit = (winSize.height - (AppTheme.visible_tile + 1) * AppTheme.tile_interval) / AppTheme.visible_tile
    }
    
    func length(count: Int) -> CGFloat {
        return length(CGFloat(count))
    }
    
    func length(count: CGFloat) -> CGFloat {
        return unit * count
    }
}
