//
//  ViewController.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/6.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import SpriteKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var smartLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        test.text = "Grubby Worm"
//        test.font = UIFont(name: "Stiff Staff", size: 100)
//        test.center = CGPointMake(350, 160)
//        test.textAlignment = .Center
//        test.textColor = UIColor.orangeColor()
//        
//        self.view.addSubview(test)
//        var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("sayHello"), userInfo: nil, repeats: true)
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsDrawCount = true
        
        let skScene = SKScene(size: skView.frame.size)
        skScene.backgroundColor = SKColor.brownColor()
        skView.presentScene(skScene)
        
//        var title = SKLabelNode(fontNamed: "Stiff Staff")
//        title.text = "Grubby Worm"
//        title.fontSize = 50
//        title.position = CGPointMake(CGRectGetMidX(skView.frame), CGRectGetMidY(skView.frame))
//        
//        skScene.addChild(title)
        
        
//        let button = SKSpriteNode(imageNamed: "green")
//        button.position = CGPointMake(CGRectGetMidX(skView.frame), CGRectGetMidY(skView.frame) - 50)
//        button.name = "green button"
//        button.centerRect = CGRectMake(12.0/28.0,12.0/28.0,4.0/28.0,4.0/28.0)
//        button.size = CGSizeMake(200, 40)
//        
//        skScene.addChild(button)

//        var base = SKSpriteNode(imageNamed: "base")
//        base.position = CGPointMake(CGRectGetMidX(skView.frame), CGRectGetMidY(skView.frame) - 50)
//        
//        skScene.addChild(base)
        
        
        if let playground = Playground(size: skView.frame.size) {
            skScene.addChild(playground)
            
            let fullRotation = CGFloat(M_PI * 2)
            var anim = SKAction.rotateByAngle(fullRotation, duration: 1)
            anim = SKAction.repeatActionForever(anim)
            
//            playground.position = CGPointMake(CGRectGetMidX(skView.frame), CGRectGetMidY(skView.frame))
            
            playground.runAction(anim)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

