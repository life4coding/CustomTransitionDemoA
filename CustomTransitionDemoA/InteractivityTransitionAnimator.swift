//
//  InteractivityTransitionAnimator.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/14.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class InteractivityTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let targetEdge: UIRectEdge
    
    init(targetEdge: UIRectEdge) {
        
        self.targetEdge = targetEdge
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        let containerView = transitionContext.containerView()
        
        let isPresenting = (toVC?.presentingViewController == fromVC)
        let fromVCFrame = transitionContext.initialFrameForViewController(fromVC!)
        let toVCFrame = transitionContext.finalFrameForViewController(toVC!)
        
        
        let offset: CGVector
        switch self.targetEdge {
        case UIRectEdge.Top: offset = CGVectorMake(0, 1)
        case UIRectEdge.Bottom: offset = CGVectorMake(0, -1)
        case UIRectEdge.Left: offset = CGVectorMake(1, 0)
        case UIRectEdge.Right: offset = CGVectorMake(-1, 0)
        default:fatalError("targetEdge must be one of UIRectEdgeTop, UIRectEdgeBottom, UIRectEdgeLeft, or UIRectEdgeRight.")
        }
        
        if isPresenting {
            fromView?.frame = fromVCFrame
            toView?.frame = CGRectOffset(toVCFrame, toVCFrame.size.width * offset.dx * -1,
                toVCFrame.size.height * offset.dy * -1)
            containerView?.addSubview(toView!)
        } else {
            fromView?.frame = fromVCFrame
            toView?.frame = toVCFrame
            containerView?.insertSubview(toView!, belowSubview: fromView!)
        }
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            if isPresenting {
                toView?.frame = toVCFrame
            } else {
                fromView?.frame = CGRectOffset(fromVCFrame, fromVCFrame.size.width * offset.dx,
                    fromVCFrame.size.height * offset.dy)
            }
            }) { (finished: Bool) -> Void in
                let wasCanceled = transitionContext.transitionWasCancelled()
                if wasCanceled {toView?.removeFromSuperview()}
                transitionContext.completeTransition(!wasCanceled)
        }
    }

    
    }

