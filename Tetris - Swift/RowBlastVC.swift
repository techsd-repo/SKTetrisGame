//
//  File.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/16/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import UIKit

class RowBlastVC: UIViewController {
    
    @IBOutlet weak var lv1label: UILabel!
 
    @IBOutlet weak var totalTokens: UILabel!
    var sd = ScoreDelegate()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       totalTokens.text = String(sd.readTotalTokens())
        lv1label.text = String(sd.readRB())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func prlevel1(sender: AnyObject) {
        if (sd.readTotalTokens() - 3 >= 0) {
        sd.setTotalTokens(sd.readTotalTokens() - 3)
        sd.setrbLevel1(sd.readRB() + 1)
        lv1label.text = String(sd.readRB())
        totalTokens.text = String(sd.readTotalTokens())
        }
    }
        
    
}