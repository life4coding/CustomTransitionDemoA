//
//  CustomStoryBoardSegue.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/14.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class CustomStoryBoardSegue: UIStoryboardSegue {

    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        let externalSB : UIStoryboard = UIStoryboard(name: identifier!, bundle:NSBundle.mainBundle())
        
        let initialVC = externalSB.instantiateInitialViewController()
        
        super.init(identifier: identifier, source: source, destination: initialVC!)
        
    }
    
    
    override func perform() {
        self.sourceViewController.presentViewController(self.destinationViewController, animated: true, completion: nil)
    }
    
}
