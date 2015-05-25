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
    @IBOutlet weak var lv2label: UILabel!
    @IBOutlet weak var lv3label: UILabel!
    @IBOutlet weak var totalTokens: UILabel!
    var sd = ScoreDelegate()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       totalTokens.text = String(sd.readTotalTokens())
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func prlevel1(sender: AnyObject) {
        if (sd.readTotalTokens() - 3 >= 0) {
        sd.setTotalTokens(sd.readTotalTokens() - 3)
        sd.setrbLevel1(sd.readRB("1") + 1)
        lv1label.text = String(sd.readRB("1"))
        totalTokens.text = String(sd.readTotalTokens())
        }
    }
        
    
    
  
    @IBAction func prlevel2(sender: AnyObject) {
        if (sd.readTotalTokens() - 6 >= 0) {
            sd.setTotalTokens(sd.readTotalTokens() - 6)
            sd.setrbLevel2(sd.readRB("2") + 1)
            lv2label.text = String(sd.readRB("2"))
            totalTokens.text = String(sd.readTotalTokens())
        }
    }
    
    
  
    @IBAction func prlevel3(sender: AnyObject) {
        if (sd.readTotalTokens() - 10 >= 0) {
        sd.setTotalTokens(sd.readTotalTokens() - 10)
        sd.setrblevel3(sd.readRB("3") + 1)
        lv3label.text = String(sd.readRB("3"))
        totalTokens.text = String(sd.readTotalTokens())
        }
    }
}