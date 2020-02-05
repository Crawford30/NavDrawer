//
//  SlideInTransition.swift
//  NaviagtionDrawer(SlideInTransition)
//
//  Created by JOEL CRAWFORD on 2/5/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject,UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    var dimmingView = UIView() // adding a dim view, when we are presenting
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        
        let containerView = transitionContext.containerView
        
        //=====constants for final width of menu view controller==
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        //====creating condition===
        if isPresenting {
            ///adding a background color to the dimmimg view
            dimmingView.backgroundColor = .black
            dimmingView.alpha =  0.0
            //========addding a dimming view=====
            containerView.addSubview(dimmingView)
            //===we give a dimming view a frame after adding it====
            dimmingView.frame  = containerView.bounds
            
            //=====add menu view controller to container====
            containerView.addSubview(toViewController.view)
            
            ///====initial frame off the screen===
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
            
        }
        
        //======animate view controller onto the screen=== we use closure==animate onto scren, can be translation
        
        let transform  = {
            //====show dimming view when on screen
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0 )
            
        }
        //=====reset the animation when dismissing===Anmate back off screen==
        let identify = {
            //====remove dimming view when on screen, set it back to 0
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform  = .identity //setting it back to identity ie the tranform
        }
        
        //===========ANIMATION OF THE TRANSITION=======
        let duration = transitionDuration(using: transitionContext)
        
        //====when animation is cancelled by the system===
        let isCancelled = transitionContext.transitionWasCancelled
        //=====animate using UIAnimation===
        UIView.animate(withDuration: duration, animations: {
            //====ask wether we presenting or not then transform===
            self.isPresenting ? transform(): identify() //identity set it back off screen
            
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
        
    }
    

}
