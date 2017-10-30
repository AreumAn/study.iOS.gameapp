//
//  StartGameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Areum on 2017-10-09.
//  Copyright © 2017 Areum. All rights reserved.
//
//  Description: First page for choosing player

import Foundation
import SpriteKit


class StartGameScene: SKScene {

        let player1_btn = SKSpriteNode(imageNamed: "player1")
        let player2_btn = SKSpriteNode(imageNamed: "player2")
    
        var background = SKSpriteNode(imageNamed: "background")
    
        override func didMove(to view: SKView) {
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
        
        let player1_label = SKLabelNode(fontNamed: "Chalkduster")
        player1_label.text = "player1"
        player1_label.fontSize = 30
        player1_label.fontColor = SKColor.black
        player1_label.position = CGPoint(x: size.width * 0.3, y: size.height * 0.25)
        player1_label.zPosition = 1
        
        let player2_label = SKLabelNode(fontNamed: "Chalkduster")
        player2_label.text = "player2"
        player2_label.fontSize = 30
        player2_label.fontColor = SKColor.black
        player2_label.position = CGPoint(x: size.width * 0.7, y: size.height * 0.25)
        player2_label.zPosition = 1
        
        player1_btn.size = CGSize(width: 150, height: 150)
        player1_btn.position = CGPoint(x: size.width * 0.3, y: size.height * 0.55)
        player1_btn.zPosition = 1
        
        player2_btn.size = CGSize(width: 150, height: 150)
        player2_btn.position = CGPoint(x: size.width * 0.7, y: size.height * 0.55)
        player2_btn.zPosition = 1
        
        self.addChild(player1_btn)
        self.addChild(player2_btn)
        self.addChild(player1_label)
        self.addChild(player2_label)
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: self)
            
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            
            // Check if the location of the touch is within the button's bounds
            if player1_btn.contains(location) {
                run(SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: false))
                let gameScene = SpeedSetScene(size: size, whoplay: "player1")
                self.view?.presentScene(gameScene, transition:reveal)
            }else if player2_btn.contains(location) {
                run(SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: false))
                let gameScene = SpeedSetScene(size: size, whoplay: "player2")
                self.view?.presentScene(gameScene, transition:reveal)
            }
        }

    }

}
