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

class Tile : SKNode {
    
    var style: TileStyle = .Normal
    var location: Location
    var size: CGSize
    
    init(size: CGSize, location: Location, style: TileStyle = .Normal) {
        self.style = style
        self.location = location
        self.size = size
        
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
