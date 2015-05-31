//
//  Playground.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//
import SpriteKit

class Playground : SKNode {
    var size: CGSize {
        didSet {
            drawGrid()
        }
    }
    
    var root: SKNode
    var tiles: [Tile]
    var grids: [SKNode]

    override var description: String {
        return super.description + " size: {\(size.width), \(size.height)}"
    }
    
    init(size: CGSize) {
        
        // init property
        self.size = size
        self.root = SKNode()
        self.grids = []
        self.tiles = []
        
        super.init()
        
        // call method after super init
        self.addChild(self.root)
        self.drawGrid()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _showLocation(node: SKNode, row: Int, col: Int) {
        let num = SKLabelNode()
        num.text = "\(row).\(col)"
        num.fontSize = 16
        num.fontColor = SKColor.blackColor()
    
        node.addChild(num)
    }
    
    private func _addIntoCache(node: SKNode) {
        grids.append(node)
    }
    
    func drawGrid() {
        root.removeAllChildren()
        
        let gridSize = Constants.PlaygroundGridSize
        
        println("old size: \(size)")
        let unit = CGFloat(size.width - Constants.blockSplit) / CGFloat(Constants.visibleBlock) - Constants.blockSplit
        
        println("old unit: \(unit)")
        
        let offsetRow = Int(gridSize.row / -2)
        let offsetCol = Int(gridSize.col / -2)
        
//        let light = randomColor(hue: .Monochrome, luminosity: .Light)
        let light = SKColorWithRGB(250, 250, 250)
        let dark = SKColorWithRGB(245, 245, 245)
        
        for var i = offsetRow; i != gridSize.row + offsetRow; i++ {
            for var j = offsetCol; j != gridSize.col + offsetCol; j++ {
                
                let color = ((i + j) % 2 == 0) ? light : dark
                let grid = SKSpriteNode(color: color, size: CGSizeMake(unit, unit))
                
                let posX = (Constants.blockSplit * CGFloat(i + 1)) + unit * (CGFloat(i) + 0.5)
                let posY = (Constants.blockSplit * CGFloat(j + 1)) + unit * (CGFloat(j) + 0.5)
                
                grid.position = CGPointMake(posX, posY)
                
                let row = i - offsetRow
                let col = j - offsetCol
//                _showLocation(grid, row: row, col: col)
                _addIntoCache(grid)
                
                root.addChild(grid)
            }
        }
    }
    
}
