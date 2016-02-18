//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Graeme Harrison on 2016-02-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var navBarView: UIView!
    @IBOutlet var navBarHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusButton(sender: UIButton) {
        navBarSpringAnimation()
        plusButtonRotateAnimation()
    }
    
    func plusButtonRotateAnimation() {
        UIView.animateWithDuration(0.8,
            delay: 0.0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0.1,
            options: .CurveLinear,
            animations: {self.plusButton.transform = CGAffineTransformRotate(self.plusButton.transform, CGFloat(M_PI_2))},
            completion: {(value: Bool) in })
    }
    
    func navBarSpringAnimation() {
        if self.navBarHeightConstraint.constant == 64 {
            self.navBarHeightConstraint.constant = 200
            
            //            UIView.animateWithDuration(0.5) {
            //                self.view.layoutIfNeeded()
            //            }
            
            UIView.animateWithDuration(1.0,
                delay: 0.0,
                usingSpringWithDamping: 0.3,
                initialSpringVelocity: 0.8,
                options: .CurveLinear,
                animations: {
                self.view.layoutIfNeeded()
                }, completion: {
                    (value: Bool) in
            })
        }
        else {
            self.navBarHeightConstraint.constant = 64
            UIView.animateWithDuration(1.0,
                delay: 0.0,
                usingSpringWithDamping: 0.3,
                initialSpringVelocity: 0.8,
                options: .CurveLinear,
                animations: {
                self.view.layoutIfNeeded()
                }, completion: {
                    (value: Bool) in
            })
        }
    }
}

