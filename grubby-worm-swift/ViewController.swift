//
//  ViewController.swift
//  grubby-worm-swift
//
//  Created by Wayne on 15/4/6.
//  Copyright (c) 2015年 Wayne. All rights reserved.
//

import UIKit
import LTMorphingLabel

class ViewController: UIViewController {
    
//    @IBOutlet weak var smartLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var label = LTMorphingLabel(frame: CGRectMake(0, 0, 200, 21))
        label.center = CGPointMake(160, 284)
        label.textAlignment = NSTextAlignment.Center
            
        self.view.addSubview(label)
        
        label.text = "Grubby Worm!"
        
        var delta: Int64 = 5 * Int64(NSEC_PER_SEC)
        
        var time = dispatch_time(DISPATCH_TIME_NOW, delta)
        
        dispatch_after(time, dispatch_get_main_queue(), {
            label.text = "Swift"
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

