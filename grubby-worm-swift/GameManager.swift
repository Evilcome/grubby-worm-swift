//
//  GameManager.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/5/30.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

class GameManager {
    
    private static let sharedInstance = GameManager()
    
    class var sharedManager: GameManager {
        return sharedInstance
    }

}
