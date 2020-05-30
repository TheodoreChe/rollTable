//
//  GameViewController.swift
//  Lines
//
//  Created by Федор Чернин on 30.05.2020.
//  Copyright © 2020 Theodore Che. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var gameView: SCNView {
        return view as! SCNView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let scene = SCNScene(named: "art.scnassets/scene.scn")
            else { fatalError("Unable to load scene file.") }
        
        gameView.scene = scene
        
        // Scene Background
        gameView.backgroundColor = UIColor.mainDarkBlue
        
        // Gameboard
        let gameboardGeometry = SCNBox(width: 0.8, height: 0.8, length: 0.1, chamferRadius: 0.05)
        gameboardGeometry.firstMaterial?.diffuse.contents = UIColor.mainBlue
        let gameboardNode = SCNNode(geometry: gameboardGeometry)
        gameboardNode.position = SCNVector3(0,0,0)
        scene.rootNode.addChildNode(gameboardNode)
        
        // Materials
        let mainGreenMaterial = SCNMaterial();
        mainGreenMaterial.diffuse.contents = UIColor.mainGreen
        let mainDarkGreenMaterial = SCNMaterial();
        mainDarkGreenMaterial.diffuse.contents = UIColor.mainDarkGreen
        
        // Cylinder for testing
        let cylinderGeometry = SCNCylinder(radius: 0.08, height: 0.16)
        cylinderGeometry.materials = [mainDarkGreenMaterial, mainGreenMaterial, mainGreenMaterial]
        let cylinderNode = SCNNode(geometry: cylinderGeometry)
        cylinderNode.position = SCNVector3(0,0,0.6)
        scene.rootNode.addChildNode(cylinderNode)
        cylinderNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 2, y: 0, z: 2, duration: 1)))
        
        // Cylinder for testing
        let cylinderGeometry2 = SCNCylinder(radius: 0.08, height: 0.16)
        cylinderGeometry2.materials = [mainDarkGreenMaterial, mainGreenMaterial, mainGreenMaterial]
        let cylinderNode2 = SCNNode(geometry: cylinderGeometry2)
        cylinderNode2.position = SCNVector3(0,0.25,0.6)
        scene.rootNode.addChildNode(cylinderNode2)
        cylinderNode2.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 2, y: 0, z: 2, duration: 1)))
        
        // Dev stats
        gameView.showsStatistics = true
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}
