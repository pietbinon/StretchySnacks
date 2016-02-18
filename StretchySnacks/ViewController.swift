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
    
    var stackView : UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavBar()
    }
    
    func prepareNavBar() {
        
        let oreosView : UIImageView = UIImageView()
        oreosView.heightAnchor.constraintEqualToConstant(120.0).active = true
        oreosView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        oreosView.image = UIImage(named: "oreos")

        let pizzaPocketsView : UIImageView = UIImageView()
        pizzaPocketsView.heightAnchor.constraintEqualToConstant(120.0).active = true
        pizzaPocketsView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        pizzaPocketsView.image = UIImage(named: "pizza_pockets")
        
        let popTartsView : UIImageView = UIImageView()
        popTartsView.heightAnchor.constraintEqualToConstant(120.0).active = true
        popTartsView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        popTartsView.image = UIImage(named: "pop_tarts")
        
        let popsicleView : UIImageView = UIImageView()
        popsicleView.heightAnchor.constraintEqualToConstant(120.0).active = true
        popsicleView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        popsicleView.image = UIImage(named: "popsicle")
        
        let ramenView : UIImageView = UIImageView()
        ramenView.heightAnchor.constraintEqualToConstant(120.0).active = true
        ramenView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        ramenView.image = UIImage(named: "ramen")
        
        //Stack View
        stackView.axis = UILayoutConstraintAxis.Horizontal
        stackView.distribution = UIStackViewDistribution.EqualSpacing
        stackView.alignment = UIStackViewAlignment.Center
        stackView.hidden = true
        //        stackView.spacing = 1.0
        
        stackView.addArrangedSubview(oreosView)
        stackView.addArrangedSubview(pizzaPocketsView)
        stackView.addArrangedSubview(popTartsView)
        stackView.addArrangedSubview(popsicleView)
        stackView.addArrangedSubview(ramenView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        navBarView.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraintEqualToAnchor(self.navBarView.centerXAnchor).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(self.navBarView.bottomAnchor).active = true
    }
    
    @IBAction func plusButton(sender: UIButton) {
        navBarAnimation()
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
    
    func navBarAnimation() {
        if self.navBarHeightConstraint.constant == 64 {
            self.navBarHeightConstraint.constant = 200
            stackView.hidden = false
            
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
            stackView.hidden = true
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

