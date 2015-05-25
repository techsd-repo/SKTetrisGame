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
    override func viewDidLoad() {
        super.viewDidLoad()
        hscore.text = String(sd.readHighScore())
    }
    
    var sd = ScoreDelegate()
    
    
}
