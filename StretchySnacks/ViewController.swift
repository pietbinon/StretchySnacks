//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Graeme Harrison on 2016-02-18.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var navBarView: UIView!
    @IBOutlet var navBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    
    var stackView : UIStackView = UIStackView()
    var snacksLabel : UILabel = UILabel()
    var labelHeight : NSLayoutConstraint!
    var snacksArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavBar()
    }
    
    func prepareNavBar() {
        
//        let oreosView : UIImageView = UIImageView()
//        oreosView.heightAnchor.constraintEqualToConstant(120.0).active = true
//        oreosView.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
//        oreosView.image = UIImage(named: "oreos")
//        oreoButton.addSubview(oreosView)

        // Buttons
        let oreoButton : UIButton = UIButton()
        oreoButton.heightAnchor.constraintEqualToConstant(120.0).active = true
        oreoButton.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        oreoButton.tag = 1
        oreoButton.addTarget(self, action: "addSnack:", forControlEvents: .TouchUpInside)
        oreoButton.setImage(UIImage(named: "oreos"), forState: .Normal)
        
        let pizzaPocketsButton = UIButton()
        pizzaPocketsButton.heightAnchor.constraintEqualToConstant(120.0).active = true
        pizzaPocketsButton.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        pizzaPocketsButton.tag = 2
        pizzaPocketsButton.addTarget(self, action: "addSnack:", forControlEvents: .TouchUpInside)
        pizzaPocketsButton.setImage(UIImage(named: "pizza_pockets"), forState: .Normal)
        
        let popTartsButton = UIButton()
        popTartsButton.heightAnchor.constraintEqualToConstant(120.0).active = true
        popTartsButton.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        popTartsButton.tag = 3
        popTartsButton.addTarget(self, action: "addSnack:", forControlEvents: .TouchUpInside)
        popTartsButton.setImage(UIImage(named: "pop_tarts"), forState: .Normal)
        
        let popsicleButton = UIButton()
        popsicleButton.heightAnchor.constraintEqualToConstant(120.0).active = true
        popsicleButton.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        popsicleButton.tag = 4
        popsicleButton.addTarget(self, action: "addSnack:", forControlEvents: .TouchUpInside)
        popsicleButton.setImage(UIImage(named: "popsicle"), forState: .Normal)
        
        let ramenButton = UIButton()
        ramenButton.heightAnchor.constraintEqualToConstant(120.0).active = true
        ramenButton.widthAnchor.constraintEqualToConstant(self.view.frame.size.width/5.0).active = true
        ramenButton.tag = 5
        ramenButton.addTarget(self, action: "addSnack:", forControlEvents: .TouchUpInside)
        ramenButton.setImage(UIImage(named: "ramen"), forState: .Normal)
        
        // Stack View
        stackView.axis = UILayoutConstraintAxis.Horizontal
        stackView.distribution = UIStackViewDistribution.EqualSpacing
        stackView.alignment = UIStackViewAlignment.Center
        stackView.hidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.spacing = 0.0

        stackView.addArrangedSubview(oreoButton)
        stackView.addArrangedSubview(pizzaPocketsButton)
        stackView.addArrangedSubview(popTartsButton)
        stackView.addArrangedSubview(popsicleButton)
        stackView.addArrangedSubview(ramenButton)
        navBarView.addSubview(stackView)
        
        // Text Label
        snacksLabel.text = "SNACKS"
        snacksLabel.textAlignment = .Center
//        textLabel.frame.size.height = 20.0
//        textLabel.frame.size.width = navBarView.frame.size.width
//        textLabel.center.x = navBarView.center.x
        snacksLabel.translatesAutoresizingMaskIntoConstraints = false;
        navBarView.addSubview(snacksLabel)

        //Constraints
        stackView.centerXAnchor.constraintEqualToAnchor(navBarView.centerXAnchor).active = true
        stackView.bottomAnchor.constraintEqualToAnchor(navBarView.bottomAnchor).active = true
        snacksLabel.centerXAnchor.constraintEqualToAnchor(navBarView.centerXAnchor).active = true
        labelHeight = snacksLabel.centerYAnchor.constraintEqualToAnchor(navBarView.centerYAnchor, constant: 0.0)
        labelHeight.active = true
    }
    
    func addSnack(sender: UIButton) {
        switch (sender.tag) {
        case 1:
            let oreo = "Oreo"
            snacksArray.append(oreo)
        
        case 2:
            let pizzaPocket = "Pizza Pocket"
            snacksArray.append(pizzaPocket)
            
        case 3:
            let popTart = "Pop Tart"
            snacksArray.append(popTart)
            
        case 4:
            let popsicle = "Popsicle"
            snacksArray.append(popsicle)
            
        case 5:
            let ramen = "Ramen"
            snacksArray.append(ramen)
        
        default:
            print("something ain't right!")
        }
        tableView.reloadData()
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
            labelHeight.constant = -40.0
            stackView.hidden = false
            
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
            labelHeight.constant = 0.0
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
    
    //MARK: Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacksArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let snack = snacksArray[indexPath.row] as String
        cell.textLabel!.text = snack
        return cell
    }
}

//            UIView.animateWithDuration(0.5) {
//                self.view.layoutIfNeeded()
//            }
