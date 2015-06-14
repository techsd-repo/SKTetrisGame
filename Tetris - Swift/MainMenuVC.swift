//
//  MainMenuVC.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/25/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import Foundation
import UIKit

class mmvc:UIViewController {
    @IBOutlet weak var hscore: UILabel!
     var sd = ScoreDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        hscore.text = "High Score:" + String(sd.readHighScore())
    }
    
   
    
    
}
