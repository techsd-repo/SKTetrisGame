//
//  ScoreDelegateClass.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 5/16/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import Foundation





public class ScoreDelegate {
    let HighScoreDefault = NSUserDefaults.standardUserDefaults()
    let CurrScoreDefault = NSUserDefaults.standardUserDefaults()
    var df: Int = 0
    
    
    func setHighScore(hint: Int) {
        HighScoreDefault.setInteger(hint, forKey: "HighScore")
    }
    
    func readHighScore() -> Int {
        var hsread: Int
         hsread = HighScoreDefault.integerForKey("HighScore")
        return hsread
        
    }
    
    func setCurrScore(cint: Int) {
        CurrScoreDefault.setInteger(cint, forKey: "CurrScore")
    }
    
    func readCurrScore() -> Int {
        var hsread: Int
        hsread = CurrScoreDefault.integerForKey("CurrScore")
        return hsread
    }
    
    func resetCurrScore() {
        CurrScoreDefault.setInteger(0, forKey: "CurrScore")
        
    }
    
    func resetHighScore() {
        HighScoreDefault.setInteger(0, forKey: "HighScore")
    }
    
    // We manage tokens here:
  
    //NOTE: Put total points here:
    //Only call when game ends to add points
    func setTotalPoints() {
        var bScore: Int?
        var total: Int?
        var pointsToAdd: Int?
        var td = Tetris()
    
       bScore = CurrScoreDefault.integerForKey("CurrScore")
       pointsToAdd = CurrScoreDefault.integerForKey("TotalPoints")
        
       total = bScore! + pointsToAdd!
        
       CurrScoreDefault.setInteger(total!, forKey: "TotalPoints")
        
        if (td.isGameRunning == false) {
           resetCurrScore()
            
        }
       
    }
    
    
    func readTotalPoints() -> Int {
        return CurrScoreDefault.integerForKey("TotalPoints")
    }
    
    func setPoints(pts: Int) {
        CurrScoreDefault.setInteger(pts, forKey: "TotalPoints")
    }
    
    
    //Add tokens functions here
    //Add game tokens later, right now only do trade ins, we'll have to figure out when they get the same color, etc
    
    func setTotalTokens(tokens: Int) {
        CurrScoreDefault.setInteger(tokens, forKey: "TotalTokens")
    }
    
    
    //RowBlastDefaults
    
    let rbDefaults = NSUserDefaults.standardUserDefaults()
    
}