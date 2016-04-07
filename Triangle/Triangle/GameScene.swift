//
//  GameScene.swift
//  Triangle
//
//  Created by Justin Vasselli on 4/4/16.
//  Copyright (c) 2016 Justin Vasselli. All rights reserved.
//

import SpriteKit

struct PhysicsLayer {
    static let None: UInt32 = 0
    static let All: UInt32 = UInt32.max
    static let Player: UInt32 = 0b1
    static let InvadingSpaceship: UInt32 = 0b10
}

// &
// None   0000
// All    1111
// Player 0001
// InSp   0010

// 1 & 1 = 1
// 1 & 0 = 0
// 0 & 1 = 0
// 0 & 0 = 0

// 1 | 1 = 1
// 1 | 0 = 1
// 0 | 1 = 1
// 0 | 0 = 0

// 0010
// 0001
// 0010 & 0001 = 0000

// 1111
// 0010
// 0010 != 0

class GameScene: SKScene, SKPhysicsContactDelegate {
    let player = SKSpriteNode(imageNamed: "Triangle")
    
    //SKScene version of viewDidLoad
    override func didMoveToView(view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        /* Setup your scene here */
        player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
        player.physicsBody?.categoryBitMask = PhysicsLayer.Player
        player.physicsBody?.collisionBitMask = PhysicsLayer.None
        player.physicsBody?.contactTestBitMask = PhysicsLayer.All
        
        player.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        self.addChild(player)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let playerLocation = player.position
            
            let distanceBetween = (location - playerLocation).magnitude()
            
            guard distanceBetween > CGRectGetWidth(player.frame) else { continue }
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.color = .blackColor()
            sprite.colorBlendFactor = 1.0
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width/2)
            sprite.physicsBody?.categoryBitMask = PhysicsLayer.InvadingSpaceship
            sprite.physicsBody?.collisionBitMask = PhysicsLayer.None
            sprite.physicsBody?.contactTestBitMask = PhysicsLayer.Player
            
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration: 1)
            let moveToPlayer = SKAction.moveTo(playerLocation, duration: 4)
            
            let rotateThrice = SKAction.repeatAction(action, count: 3)
            let sequence = SKAction.sequence([rotateThrice, moveToPlayer])
            sprite.runAction(sequence)
            
            self.addChild(sprite)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        let invadingSpaceship: SKSpriteNode?
        if (nodeA?.physicsBody?.categoryBitMask)! & PhysicsLayer.InvadingSpaceship != 0 {
            
            invadingSpaceship = nodeA as? SKSpriteNode
        }
        
        nodeA?.removeFromParent()
        nodeB?.removeFromParent()
    }
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

prefix func -(right: CGPoint) -> CGPoint {
    return CGPoint(x: -right.x, y: -right.y)
}

extension CGPoint {
    func magnitude() -> CGFloat {
        return sqrt(x*x + y*y)
    }
}

