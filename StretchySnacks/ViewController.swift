//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Pierre Binon on 2017-04-13.
//  Copyright © 2017 Pierre Binon. All rights reserved.
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
        
        //BUTTONS
        let oreoButton : UIButton = UIButton()
        oreoButton.heightAnchor.constraint (equalToConstant: 120.0).isActive = true
        oreoButton.widthAnchor.constraint (equalToConstant: self.view.frame.size.width / 5.0).isActive = true
        oreoButton.tag = 1
        oreoButton.addTarget (self, action: #selector (ViewController.addSnack(_:)), for: .touchUpInside)
        oreoButton.setImage (UIImage(named: "oreos"), for: UIControlState())
        
        let pizzaPocketsButton = UIButton()
        pizzaPocketsButton.heightAnchor.constraint (equalToConstant: 120.0).isActive = true
        pizzaPocketsButton.widthAnchor.constraint (equalToConstant: self.view.frame.size.width / 5.0).isActive = true
        pizzaPocketsButton.tag = 2
        pizzaPocketsButton.addTarget (self, action: #selector (ViewController.addSnack(_:)), for: .touchUpInside)
        pizzaPocketsButton.setImage (UIImage (named: "pizza_pockets"), for: UIControlState())
        
        let popTartsButton = UIButton()
        popTartsButton.heightAnchor.constraint (equalToConstant: 120.0).isActive = true
        popTartsButton.widthAnchor.constraint (equalToConstant: self.view.frame.size.width / 5.0).isActive = true
        popTartsButton.tag = 3
        popTartsButton.addTarget (self, action: #selector( ViewController.addSnack(_:)), for: .touchUpInside)
        popTartsButton.setImage(UIImage (named: "pop_tarts"), for: UIControlState())
        
        let popsicleButton = UIButton()
        popsicleButton.heightAnchor.constraint (equalToConstant: 120.0).isActive = true
        popsicleButton.widthAnchor.constraint (equalToConstant: self.view.frame.size.width / 5.0).isActive = true
        popsicleButton.tag = 4
        popsicleButton.addTarget (self, action: #selector (ViewController.addSnack(_:)), for: .touchUpInside)
        popsicleButton.setImage (UIImage (named: "popsicle"), for: UIControlState())
        
        let ramenButton = UIButton()
        ramenButton.heightAnchor.constraint (equalToConstant: 120.0).isActive = true
        ramenButton.widthAnchor.constraint (equalToConstant: self.view.frame.size.width / 5.0).isActive = true
        ramenButton.tag = 5
        ramenButton.addTarget (self, action: #selector (ViewController.addSnack(_:)), for: .touchUpInside)
        ramenButton.setImage (UIImage(named: "ramen"), for: UIControlState())
 
        
        //STACK VIEW
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.isHidden = true
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.spacing = 0.0

        //Add buttons to the stack View
        stackView.addArrangedSubview (oreoButton)
        stackView.addArrangedSubview (pizzaPocketsButton)
        stackView.addArrangedSubview (popTartsButton)
        stackView.addArrangedSubview (popsicleButton)
        stackView.addArrangedSubview (ramenButton)
        navBarView.addSubview (stackView)

        
        //TEXT LABEL
        snacksLabel.text = "SNACKS"
        snacksLabel.textAlignment = .center
        snacksLabel.translatesAutoresizingMaskIntoConstraints = false;
        navBarView.addSubview (snacksLabel)

        
        //CONSTRAINTS
        stackView.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        snacksLabel.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        labelHeight = snacksLabel.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor, constant: 0.0)
        labelHeight.isActive = true
    }

    
    func addSnack(_ sender: UIButton) {
        
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
            print("something went WRONG!")
        }
        
        tableView.reloadData()
    }

    
    @IBAction func plusButton(_ sender: UIButton) {
        
        navBarAnimation()
        plusButtonRotateAnimation()
        print ("plus icon pressed")
    }
    
    
    func plusButtonRotateAnimation() {
        
        UIView.animate(withDuration: 0.8,
                       delay: 0.0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.1,
                       options: .curveLinear,
                       animations: {self.plusButton.transform = self.plusButton.transform.rotated(by: CGFloat(Double.pi / 4))},
                       completion: {(value: Bool) in })
    }
    
    
    func navBarAnimation() {
        
        if self.navBarHeightConstraint.constant == 64 {
            
            self.navBarHeightConstraint.constant = 200
            labelHeight.constant = -40.0
            stackView.isHidden = false
            
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            
                            self.view.layoutIfNeeded()
                            }, completion: {
                                
                                (value: Bool) in
            })
        }
            
        else {
            
            self.navBarHeightConstraint.constant = 64
            labelHeight.constant = 0.0
            stackView.isHidden = true
            
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.8,
                           options: .curveLinear,
                           animations: {
                            
                            self.view.layoutIfNeeded()
                            }, completion: {
                                (value: Bool) in
            })
        }
    }
    
    
    
    
    //MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return snacksArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell (withIdentifier: "Cell", for: indexPath)
        let snack = snacksArray[indexPath.row] as String
        cell.textLabel!.text = snack
        return cell
    }
}
