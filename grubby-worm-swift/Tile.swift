//
//  Tile.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/27.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

struct TileConstants{
    static let light = SKColorWithRGB(250, 250, 250)
    static let dark = SKColorWithRGB(245, 245, 245)
}

enum TileColor {
    case Light
    case Dark
}

class Tile : SKNode {
    
    var location: Location
    
    init(color: TileColor, size: CGSize, location: Location) {
        self.location = location
        
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
