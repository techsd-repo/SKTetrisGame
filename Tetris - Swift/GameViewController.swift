//
//  GameViewController.swift
//  Tetris - Swift
//
//  Created by TheTechsd on 4/10/15.
//  Copyright (c) 2015 TheTechsd. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation


class GameViewController: UIViewController, tetrisDelegate, UIGestureRecognizerDelegate {

  
    
    var isUsingTimerMode = false
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeScore: UILabel!

    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
       
    var scene: GameScene!
    var tetris:Tetris!
    var td:tetrisDelegate!
    var panPointReference:CGPoint?
  

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        scene.tick = didTick
        
        tetris = Tetris()
        tetris.delegate = self
        tetris.beginGame()
        
        skView.presentScene(scene)
        
        
        
        

    }
   
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        tetris.rotateShape()
                   
       
    }
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        
        let currentPoint = sender.translationInView(self.view)
        if let originalPoint = panPointReference {
            if abs(currentPoint.x - originalPoint.x) > (BlockSize * 0.9) {
                if sender.velocityInView(self.view).x > CGFloat(0) {
                    tetris.moveShapeRight()
                    panPointReference = currentPoint
                } else {
                    tetris.moveShapeLeft()
                    panPointReference = currentPoint
                }
            }
        } else if sender.state == .Began {
            panPointReference = currentPoint
        }
    }
    
    @IBAction func didSwipe(sender: UISwipeGestureRecognizer) {
        tetris.dropShape()
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let swipeRec = gestureRecognizer as? UISwipeGestureRecognizer {
            if let panRec = otherGestureRecognizer as? UIPanGestureRecognizer {
                return true
            }
        } else if let panRec = gestureRecognizer as? UIPanGestureRecognizer {
            if let tapRec = otherGestureRecognizer as? UITapGestureRecognizer {
                return true
            }
        }
        return false
    }
    
    func didTick() {
        tetris.letShapeFall()
        
      }
    
    func updateTime() {
        
    }
    
    func nextShape() {
        let newShapes = tetris.newShape()
        if let fallingShape = newShapes.fallingShape {
            self.scene.addPreviewShapeToScene(newShapes.nextShape!) {}
            self.scene.movePreviewShape(fallingShape) {
                // #2
                self.tetris.letShapeFall()
                self.view.userInteractionEnabled = true
                self.scene.startTicking()
            }
        }
    }
    
    func gameDidBegin(tetris: Tetris) {
        scene.tickLengthMillis = TickLengthLevelOne
        
        scoreLabel.text = "\(tetris.score)"
        levelLabel.text = "\(tetris.level)"
        
        // The following is false when restarting a new game
        if tetris.nextShape != nil && tetris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(tetris.nextShape!) {
                self.nextShape()
            }
        } else {
            nextShape()
        }
    }
    
    func gameDidEnd(tetris: Tetris) {
        view.userInteractionEnabled = false
        scene.stopTicking()
        scene.playSound("gameover.mp3")
        scene.animatateCollapsingLines(tetris.removeAllBlocks(), fallenBlocks: Array<Array<Block>>()) {
            tetris.beginGame() //MARK
        }
        
        // Stop the timer and set it to nil here
        
    }
    
    func gameDidLevelUp(tetris: Tetris) {
        levelLabel.text = "\(tetris.level)"
        scoreLabel.text = "\(tetris.score)"
        if scene.tickLengthMillis >= 100 {
            scene.tickLengthMillis -= 100
        } else if scene.tickLengthMillis > 50 {
            scene.tickLengthMillis -= 50
        }
        scene.playSound("levelup.mp3")
    }
    
    func gameShapeDidDrop(tetris: Tetris) {
        scene.stopTicking()
        scene.redrawShape(tetris.fallingShape!) {
            tetris.letShapeFall()
        }
        scene.playSound("drop.mp3")
    }
    
    func gameShapeDidLand(tetris: Tetris) {
        scene.stopTicking()
        self.view.userInteractionEnabled = false
        
        let removedLines = tetris.removeCompletedLines()
        if removedLines.linesRemoved.count > 0 {
            
            scoreLabel.text = "\(tetris.score)"
            var sd = ScoreDelegate()
            sd.setCurrScore(tetris.score)
            sd.setTotalPoints()
            
            scene.animatateCollapsingLines(removedLines.linesRemoved, fallenBlocks: removedLines.fallenBlocks) {
                self.gameShapeDidLand(tetris)
            }
            scene.playSound("bomb.mp3")
        } else {
            nextShape()
        }
    }
    

    // #3
    func gameShapeDidMove(tetris: Tetris) {
        scene.redrawShape(tetris.fallingShape!) {
        
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
