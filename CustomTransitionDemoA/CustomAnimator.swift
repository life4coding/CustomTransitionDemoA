//
//  CustomAnimator.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/11.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()
        
        
           let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
           let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
               toView?.frame = CGRectMake(fromView!.frame.origin.x, fromView!.frame.maxY / 2, fromView!.frame.width, fromView!.frame.height)
        toView?.alpha = 0.0
        
        // 在present和，dismiss时，必须将toview添加到视图层次中
        containerView?.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(transitionContext)
        // 使用spring动画，有弹簧效果，动画结束后一定要调用completeTransition方法
        UIView.animateWithDuration(transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .CurveLinear, animations: { () -> Void in
            toView!.alpha = 1.0     // 逐渐变为不透明
            toView?.frame = transitionContext.finalFrameForViewController(toViewController!)    // 移动到指定位置
            }) { (finished: Bool) -> Void in
                let wasCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!wasCancelled)
        }
    }
}
