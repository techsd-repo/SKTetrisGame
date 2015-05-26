//
//  BlastDelegate.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/26/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import Foundation
import UIKit

class BlastDelegate : UIViewController {
    var sd = ScoreDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkForNilRowBlast() -> Bool {
        sd.readRB("1")
    }
    
}
