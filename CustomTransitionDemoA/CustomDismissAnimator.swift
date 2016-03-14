//
//  CustomDismissAnimator.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/14.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class CustomDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
        
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
       // let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewKey)
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let containerView = transitionContext.containerView()
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        
        fromView?.alpha = 1.0
        toView?.alpha = 0.0

        
        containerView?.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(transitionContext)
        
        UIView.animateWithDuration(transitionDuration, animations: { () -> Void in
            
            fromView?.alpha = 0
            toView?.alpha = 1
            
            fromView!.frame.origin.y = (fromView?.frame.height)!
            
            //fromView?.removeFromSuperview()
            
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
