//
//  SpeedSetScene.swift
//  SpriteKitSimpleGame
//
//  Created by Areum on 2017-10-09.
//  Copyright © 2017 Areum. All rights reserved.
//
//  Description: Second page for choosing speed of monsters

import Foundation
import SpriteKit


class SpeedSetScene: SKScene {
    
        let easy_btn = SKSpriteNode(imageNamed: "easy")
        let advanced_btn = SKSpriteNode(imageNamed: "advanced")
    
        var background = SKSpriteNode(imageNamed: "background")

    
        var whoplay: String
    
        init(size: CGSize, whoplay: String) {
            self.whoplay = whoplay
            super.init(size: size)
    
            background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
            addChild(background)
        
            let easy_label = SKLabelNode(fontNamed: "Chalkduster")
            easy_label.text = "Easy"
            easy_label.fontSize = 30
            easy_label.fontColor = SKColor.black
            easy_label.position = CGPoint(x: size.width * 0.3, y: size.height * 0.25)
            easy_label.zPosition = 1
        
            let advanced_label = SKLabelNode(fontNamed: "Chalkduster")
            advanced_label.text = "Advanced"
            advanced_label.fontSize = 30
            advanced_label.fontColor = SKColor.black
            advanced_label.position = CGPoint(x: size.width * 0.7, y: size.height * 0.25)
            advanced_label.zPosition = 1
        
            easy_btn.size = CGSize(width: 150, height: 150)
            easy_btn.position = CGPoint(x: size.width * 0.3, y: size.height * 0.55)
            easy_btn.zPosition = 1
        
            advanced_btn.size = CGSize(width: 150, height: 150)
            advanced_btn.position = CGPoint(x: size.width * 0.7, y: size.height * 0.55)
            advanced_btn.zPosition = 1
        
            self.addChild(easy_btn)
            self.addChild(advanced_btn)
            self.addChild(easy_label)
            self.addChild(advanced_label)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: self)
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            // Check if the location of the touch is within the button's bounds
            if easy_btn.contains(location) {
                run(SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: false))
                print(whoplay)
                let gameScene = GameScene(size: size, whoplay: whoplay, level: 1)
                self.view?.presentScene(gameScene, transition:reveal)
                print("easy click")
            }else if advanced_btn.contains(location) {
                run(SKAction.playSoundFileNamed("sound_effect.wav", waitForCompletion: false))
                print(whoplay)
                let gameScene = GameScene(size: size, whoplay: whoplay, level: 2)
                self.view?.presentScene(gameScene, transition:reveal)
                print("advanced click")
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

