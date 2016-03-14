//
//  SwipeSecondViewController.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/14.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class SwipeSecondViewController: UIViewController {

    lazy var  interactiveTransitionRecognizer: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self , action: Selector("interactiveAction"))

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactiveTransitionRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self , action: Selector("interactiveAction:"))
        
        interactiveTransitionRecognizer.edges = .Left
        
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func interactiveAction(sender: UIScreenEdgePanGestureRecognizer){
        if sender.state == .Began{
            
            if let customTransitionDelegate = self.transitioningDelegate as?  InteractivityTransitionDelegate {
            
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            customTransitionDelegate.targetEdge = .Left
                
            }
            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            
            
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
