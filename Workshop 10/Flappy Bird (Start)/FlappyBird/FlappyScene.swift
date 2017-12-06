//
//  FlappyScene.swift
//  FlappyBird
//
//  Created by Jesse Tipton on 11/29/17.
//  Copyright © 2017 MAD. All rights reserved.
//

import Foundation
import SpriteKit

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

class FlappyScene: SKScene {
    
    let birdNode: SKSpriteNode = {
        let birdTexture1 = SKTexture(image: #imageLiteral(resourceName: "Bird1"))
        birdTexture1.filteringMode = .nearest // don't blur the image at scale
        
        let birdTexture2 = SKTexture(image: #imageLiteral(resourceName: "Bird2"))
        birdTexture2.filteringMode = .nearest
        
        let birdNode = SKSpriteNode(texture: birdTexture1)
        birdNode.setScale(2)
        
        let flapAction = SKAction.animate(with: [birdTexture2, birdTexture1], timePerFrame: 0.2)
        let flapForeverAction = SKAction.repeatForever(flapAction)
        birdNode.run(flapForeverAction)
        
        birdNode.physicsBody = SKPhysicsBody(texture: birdTexture1, size: birdNode.size)
        birdNode.physicsBody?.isDynamic = true
        birdNode.physicsBody?.allowsRotation = false
        
        return birdNode
    }()

    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 113.0 / 255.0, green: 197.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        
        // World physics
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        // Add bird
        self.addChild(self.birdNode)
        self.birdNode.position = self.frame.center
        
        // Pipes
        setUpPipes()
    }
    
    func setUpPipes() {
        // get textures
        let bottomPipeTexture = SKTexture(image: #imageLiteral(resourceName: "PipeBottom"))
        bottomPipeTexture.filteringMode = .nearest
        
        let topPipeTexture = SKTexture(image: #imageLiteral(resourceName: "PipeTop"))
        topPipeTexture.filteringMode = .nearest
        
        // create nodes
        let bottomPipeNode = SKSpriteNode(texture: bottomPipeTexture)
        bottomPipeNode.setScale(2)
        bottomPipeNode.physicsBody = SKPhysicsBody(texture: bottomPipeTexture, size: bottomPipeNode.size)
        bottomPipeNode.physicsBody?.isDynamic = false
        
        let topPipeNode = SKSpriteNode(texture: topPipeTexture)
        topPipeNode.setScale(2)
        topPipeNode.physicsBody = SKPhysicsBody(texture: topPipeTexture, size: topPipeNode.size)
        topPipeNode.physicsBody?.isDynamic = false
        
        // unified pipe node
        let pipePair = SKNode()
        pipePair.addChild(bottomPipeNode)
        pipePair.addChild(topPipeNode)
        
        // random y position
        let pipeY = CGFloat(Int(arc4random()) % Int(frame.size.height / 3))
        
        bottomPipeNode.position = CGPoint(x: 0, y: pipeY)
        topPipeNode.position = CGPoint(x: 0, y: bottomPipeNode.size.height + pipeY + 200)
        
        pipePair.position = CGPoint(x: self.frame.size.width + bottomPipeNode.size.width, y: 0)
        pipePair.zPosition = -1 // behind the ground
        
        // move pipes
        let movePipesAction = SKAction.moveBy(x: -1, y: 0, duration: 0.01)
        let movePipesForeverAction = SKAction.repeatForever(movePipesAction)
        pipePair.run(movePipesForeverAction)

        self.addChild(pipePair)
    }
    
    override func update(_ currentTime: TimeInterval) {
        func clamp(min: CGFloat, max: CGFloat, value: CGFloat) -> CGFloat {
            if value > max {
                return max
            } else if value < min {
                return min
            } else {
                return value
            }
        }
        
        let value = birdNode.physicsBody!.velocity.dy * (birdNode.physicsBody!.velocity.dy < 0 ? 0.003 : 0.001)
        birdNode.zRotation = clamp(min: -1, max: 0.5, value: value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        birdNode.physicsBody?.velocity = .zero
        birdNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
    }
    
}
