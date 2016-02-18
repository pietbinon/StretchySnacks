//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Graeme Harrison on 2016-02-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navBarView: UIView!
    @IBOutlet var navBarHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func plusButton(sender: UIButton) {
        if self.navBarHeightConstraint.constant == 64 {
            self.navBarHeightConstraint.constant = 200
            UIView.animateWithDuration(0.5) {
                self.view.layoutIfNeeded()
            }
        }
        else {
            self.navBarHeightConstraint.constant = 64
            UIView.animateWithDuration(0.5) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
}

