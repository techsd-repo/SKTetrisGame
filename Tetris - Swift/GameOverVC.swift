//
//  GameOverVC.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/30/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import Foundation
import UIKit

class GameOverVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sd.readNewHSBool() != true {
            labHS.enabled = false
            labhsNum.enabled = falseç
        }
        
    }
    @IBOutlet weak var labHS: UILabel!
    @IBOutlet weak var labhsNum: UILabel!
    
    
    var sd = ScoreDelegate()
    
}