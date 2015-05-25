//
//  TradePointsVC.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/17/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import Foundation
import UIKit

class TradePointsVC: UIViewController {
    var sd = ScoreDelegate()
    var svalue = 0
    var pD = 0
    var rtvar: Bool = false
    
    
    @IBOutlet weak var tokenPurchaseAmount: UILabel!
    
    @IBOutlet weak var pointsDeduct: UILabel!
    
    @IBOutlet weak var pointsAfter: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // sd.setPoints(100)
        
        stepper.autorepeat = true
        totalPoints.text = "Total Points: \(sd.readTotalPoints())"
        stepper.maximumValue = Double(sd.readTotalPoints() / 4)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
            tokenPurchaseAmount.text = Int(sender.value).description
            svalue = Int(sender.value)
            //Call other functions here
            pDeduct()
            pAfter()
        
    }

    
    @IBAction func purchase(sender: UIButton) {
        sd.setTotalTokens(pD / 4)
        sd.setPoints(sd.readTotalPoints() - pD)
        performSegueWithIdentifier("shopsg", sender: nil)
    }
    
    func pDeduct() {
        if (rtvar == false) {
        pointsDeduct.text = "Points Taken Away: " + String(svalue * 4)
        pD = svalue * 4
        }
        
    }
    
    func pAfter() {
        if (rtvar == false) {
        var pAfter = sd.readTotalPoints() - pD
        pointsAfter.text = "Points After: \(pAfter)"
        }
    }
    
    func rtest(){
        rtvar = true
    }
}