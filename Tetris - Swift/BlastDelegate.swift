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
    var tetris = Tetris()
    var scene:GameScene?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkForNilRowBlast() -> Bool {
        if sd.readRB() > 0 {
            return true
        } else {
            return false
        }
    }
    
    
    func runRowBlastAnimation() {
        //Run animation here
        scene!.animatateCollapsingLines(tetris.removeAllBlocks(), fallenBlocks: Array<Array<Block>>()) {
            return true
        }
        
    }
    
}
