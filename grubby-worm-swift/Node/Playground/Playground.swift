//
//  Playground.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/31.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class Playground: SKNode {
   
    var gridSize = AppTheme.playground_size
    var size: CGSize
    var tiles: [Tile]
    
    init(size: CGSize) {
        
        self.size = size
        self.tiles = []
        
        super.init()
        
        drawGrid()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawGrid() {
        removeAllChildren()
        tiles.removeAll()

        let range = getGridSizeRange()
        
        for i in range.from.row...range.to.row {
            for j in range.from.col...range.to.col {
                let style: TileStyle = ((i + j) % 2 == 0) ? .Normal : .Marble
                let tile = Tile(location: GridSize(row: i, col: j), style: style)
                
                let posX = (AppTheme.tile_interval + tile.size.width) * (CGFloat(i) + 0.5)
                let posY = (AppTheme.tile_interval + tile.size.height) * (CGFloat(j) + 0.5)
                
                tile.position = CGPointMake(posX, posY)
                
                addChild(tile)
                tiles.append(tile)
            }
        }
    }
    
    func tileByLocation(location: Location) -> Tile? {
        var ret: Tile?
        
        for tile in tiles {
            if tile.location.row == location.row && tile.location.col == location.col {
                ret = tile
                break
            }
        }
        
        return ret
    }
    
    func tilesInDirect(tile: Tile, direction: Direction) -> [Tile] {
        var ret = [Tile]()
        
        ret.append(tile)
        
        switch direction {
        case .North:
            var location = tile.location
            for i in 0...4 {
                location.col++
                if let haveTile = tileByLocation(location) {
                    ret.append(haveTile)
                }
            }
            break
        default:
            break
        }
        
        return ret
    }

    func addWorm(worm: Worm, location: Location) {
        worm.playground = self
        worm.initWorm()
        worm.initLocations(location)
        addChild(worm)
        
        worm.crawl()
    }
    
    func getGridSizeRange() -> GridSizeRange {
        let from = GridSize(row: Int(-gridSize.row / 2), col: Int(-gridSize.col / 2))
        let to = GridSize(row: from.row + gridSize.row - 1, col: from.col + gridSize.col - 1)
        
        return GridSizeRange(from: from, to: to)
    }
}
