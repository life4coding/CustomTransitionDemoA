//
//  ViewController.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/11.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController , UIViewControllerTransitioningDelegate{

    
   lazy var secondViewController: ViewControllerB = ViewControllerB()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ViewControllerB") as! ViewControllerB
        
        
        secondViewController.modalPresentationStyle = .FullScreen
        secondViewController.transitioningDelegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func presentButtonPressed(sender: AnyObject) {
        
       
        
        self.presentViewController(secondViewController, animated: true , completion: nil)
        
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      
        return CustomAnimator()
        
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissAnimator()
    }

    
}

