//
//  GrubbyWorm.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/19.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class GrubbyWorm: Worm {
    
    override init() {
        super.init()
        
        info = WormInfo(name: "Grubby Worm", speed: 0.5, foot: 5, status: .Normal, type: .Grubby)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initWorm() {
        let length = UIManager.sharedManager.length(AppTheme.grubby_worm_height)
        let somiteSize = CGSizeMake(length, length)
        for i in 0..<info.foot {
            let node = SKSpriteNode(color: AppTheme.app_main_color, size: somiteSize)
            addChild(node)
            nodes.append(node)
        }
    }
    
    override func crawl() {
        timer = NSTimer.scheduledTimerWithTimeInterval(info.speed, target: self, selector: "doCrawl", userInfo: nil, repeats: true)
    }
    
    override func turn(target: Direction) {
        if direction == target.refect() {
            return
        }
        
        if direction == target {
            return
        }
        
        direction = target
        doCrawl()
        timer?.invalidate()
        
        crawl()
    }
    
    override func initLocations(location: Location) {
        locations.append(location)
        locations.append(location.left())
        locations.append(location.left().down())
        locations.append(location.left().down().down())
        locations.append(location.left().down().down().left())
        
        renderNodesPosition()
    }
    
    func doCrawl() {
        var loc = [Location]()
        loc.append(getNextLocation(locations[0]))
        
        for i in 1..<info.foot {
            loc.append(locations[i - 1])
        }
        
        locations = loc
        renderNodesPosition()
    }
}
