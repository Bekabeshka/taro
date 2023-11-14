//
//  TabBarAnimatedTransition.swift
//  MyTarot
//
//  Created by bekabeshka on 11.11.2023.
//

import UIKit

final class TabBarAnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    enum Direction {
        case toRight
        case toLeft
        
        var originPosition: CGPoint {
            switch self {
            case .toLeft:
                return CGPoint(x: screenWidth, y: 0)
            case .toRight:
                return CGPoint(x: -screenWidth, y: 0)
            }
        }
        
        var destinationPosition: CGPoint {
            return .zero
        }
        
        private var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
    }
    
    private let direction: Direction
    
    init(direction: Direction) {
        self.direction = direction
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        guard let origin = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        
        destination.frame.origin = direction.originPosition
        transitionContext.containerView.addSubview(destination)
        
        destination.alpha = 0
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0, 0.7, 0.1, 1)
        
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timingFunction)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            destination.frame.origin = self.direction.destinationPosition
            origin.alpha = 0
            destination.alpha = 1
        }, completion: { (didComplete) in
            origin.alpha = 1
            transitionContext.completeTransition(didComplete)
        })
        
        CATransaction.commit()
    }
}
