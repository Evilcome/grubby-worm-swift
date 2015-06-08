//
//  AppTheme.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/30.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

struct AppTheme {
    
    // tile
    static let playground_size = GridSize(row: 10, col: 10)
    static let tile_interval: CGFloat = 0.5
    static let visible_tile:CGFloat = 10
    
    // size
    static let tile_normal_size: CGFloat = 1.0
    static let combo_wrap_height: CGFloat = 0.9
    static let combo_bar_height: CGFloat = 0.6
    static let grubby_worm_height: CGFloat = 1.0
    
    // color
    static let app_main_color = randomColor(hue: .Blue, luminosity: .Dark)
//    static let app_main_color = SKColorWithRGB(215, 40, 60)
    static let combo_bar_color = SKColorWithRGB(255, 255, 255)
    
    static let tile_normal_color = SKColorWithRGB(250, 250, 250)
    static let tile_marble_color = SKColorWithRGB(245, 245, 245)
    
    static let grubby_worm_color = SKColorWithRGB(251, 63, 72)
}