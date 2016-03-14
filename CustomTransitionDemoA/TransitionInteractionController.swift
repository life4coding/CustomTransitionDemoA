//
//  TransitionInteractionController.swift
//  CustomTransitionDemoA
//
//  Created by kiwi on 16/3/14.
//  Copyright © 2016年 life4coding. All rights reserved.
//

import UIKit

class TransitionInteractionController: UIPercentDrivenInteractiveTransition {
    
    var transitionContext: UIViewControllerContextTransitioning? = nil
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer
    var edge: UIRectEdge

    init(gestureRecognizer: UIScreenEdgePanGestureRecognizer, edgeForDragging edge: UIRectEdge) {
        assert(edge == .Top || edge == .Bottom || edge == .Left || edge == .Right,
            "edgeForDragging must be one of UIRectEdgeTop, UIRectEdgeBottom, UIRectEdgeLeft, or UIRectEdgeRight.")
        self.gestureRecognizer = gestureRecognizer
        self.edge = edge
        
        super.init()
        self.gestureRecognizer.addTarget(self, action: Selector("gestureRecognizeDidUpdate:"))
    }
    
    override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        super.startInteractiveTransition(self.transitionContext!)
        
    }
    
    private func percentForGesture(gesture: UIScreenEdgePanGestureRecognizer) -> CGFloat{
        let containerView = transitionContext?.containerView()
        let locationInView = gesture.locationInView(containerView)
        
        let width = containerView?.bounds.width
        let height = containerView?.bounds.height
        
        switch self.edge {
        case UIRectEdge.Right: return (width! - locationInView.x) / width!
        case UIRectEdge.Left: return locationInView.x / width!
        case UIRectEdge.Bottom: return (height! - locationInView.y) / height!
        case UIRectEdge.Top: return locationInView.y / height!
        default: return 0
        }
    }
    
    func gestureRecognizeDidUpdate(gestureRecognizer: UIScreenEdgePanGestureRecognizer){
        switch gestureRecognizer.state{
        case    .Began:
            break
        case    .Changed:
            self.updateInteractiveTransition(self.percentForGesture(gestureRecognizer))
        case .Ended:
            if self.percentForGesture(gestureRecognizer) >= 0.5 {
                self.finishInteractiveTransition()
            }
            else {
                self.cancelInteractiveTransition()
            }
        default: self.cancelInteractiveTransition()
        }

    }
}


