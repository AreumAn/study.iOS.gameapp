//
//  GameOverScene.swift
//  SpriteKitSimpleGame
//
//  Created by Main Account on 9/30/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//
//  Description: gameover page

import Foundation
import SpriteKit
 
class GameOverScene: SKScene {
    
    var background = SKSpriteNode(imageNamed: "background")
    var level : Int
    
    
    init(size: CGSize, whoplay: String, level: Int, won:Bool, score: Int) {
        self.level = level
        super.init(size: size)
 
    // 1
    background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    background.zPosition = -1
    addChild(background)
 
    // 2
    var leveltext = ""
    let player = whoplay
    let message = won ? "Won!" : "Lose!"
    let score = String(score)
    
    if (level == 1) {
        leveltext = "Easy level"
    }else if (level == 2){
        leveltext = "Advanced level"
        }
            
 
    // 3
    let label = SKLabelNode(fontNamed: "Chalkduster")
    label.numberOfLines = 0
    label.text = player + " " + message + "\n" + "You broke " + score + "heart\n in " + leveltext
    label.fontSize = 40
    label.fontColor = SKColor.black
    label.position = CGPoint(x: size.width/2, y: size.height/3)
    addChild(label)
 
    // 4
    run(SKAction.sequence([
      SKAction.wait(forDuration: 3.0),
      SKAction.run() {
        // 5
        let reveal = SKTransition.flipHorizontal(withDuration: 0.8)
        let scene = StartGameScene(size: size)
        self.view?.presentScene(scene, transition:reveal)
      }
    ]))
 
  }
 
  // 6
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
