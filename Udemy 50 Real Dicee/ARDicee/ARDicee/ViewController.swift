//
//  ViewController.swift
//  ARDicee
//
//  Created by Brian Sakhuja on 3/15/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var diceArray = [SCNNode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the view's delegate
        sceneView.delegate = self
        
        // Add light
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
        //        sceneView.showsStatistics = true
        //        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        //        createCube()
        //        createMoon()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - Detect touches
    
    // Add dice wheere the user taps
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingGeometry)
            
            if let hitResult = results.first {
                addDice(atLocation: hitResult)
            }
        }
    }
    
    func addDice(atLocation location: ARHitTestResult) {
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")
        
        if let diceNode = diceScene?.rootNode.childNode(withName: "Dice", recursively: true) {
            diceNode.position = SCNVector3(x: location.worldTransform.columns.3.x,
                                           y: location.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                                           z: location.worldTransform.columns.3.z)
            
            // Add dice node to our dice node array
            diceArray.append(diceNode)
            
            sceneView.scene.rootNode.addChildNode(diceNode)
            
            roll(die: diceNode)
        }
    }
    
    
    // MARK: - Rolling function
    // Rolls all our dice
    func rollAll() {
        if !diceArray.isEmpty {
            for die in diceArray {
                roll(die: die)
            }
        }
    }
    
    // Rolls a given die
    func roll(die: SCNNode) {
        // Only need to rotate about x and z axis. Y axis is just rotating clockwise/counterclockwise on the face thats up.
        let randomX = Float(arc4random_uniform(4) + 1) * (Float.pi / 2)
        let randomZ = Float(arc4random_uniform(4) + 1) * (Float.pi / 2)
        
        die.runAction(
            SCNAction.rotateBy(x: CGFloat(randomX * 5),
                               y: 0,
                               z: CGFloat(randomZ * 5),
                               duration: 1)
        )
    }
    
    @IBAction func rollAgain(_ sender: UIBarButtonItem) {
        rollAll()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollAll()
    }
    
    @IBAction func removeAllDice(_ sender: UIBarButtonItem) {
        if !diceArray.isEmpty {
            for die in diceArray {
                die.removeFromParentNode()
            }
        }
    }
    
    
    // MARK: - ARSCNViewDelegate methods
    
    // set up our horizontal plane if we detect a horizontal plane
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        let planeNode = createPlane(withPlaneAnchor: planeAnchor)
        
        node.addChildNode(planeNode)
    }
    
    
    // MARK: - Create object functions
    
    func createPlane(withPlaneAnchor planeAnchor: ARPlaneAnchor) -> SCNNode {
        
        // Create a plane. By default the plane is vertical.
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
        let planeNode = SCNNode()
        planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.y)
        
        // Rotate plane from vertical to horizontal. (Angle is in radians (90) counterclockwise.  But we want clockwise, so we have - pi/2 (-90). Only rotate about the x axis (1,0,0).
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        // Update the grid material to the grid.png
        let gridMaterial = SCNMaterial()
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        plane.materials = [gridMaterial]
        
        // Set the node geometry to the plane
        planeNode.geometry = plane
        
        return planeNode
        
    }
    func createCube() {
        // Units are in meters
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        
        cube.materials = [material]
        
        // Create our node (a point in 3D space)
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = cube
        
        // Put our node into our scene view
        sceneView.scene.rootNode.addChildNode(node)
        
    }
    
    func createMoon() {
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        sphere.materials = [material]
        
        // Create our node (a point in 3D space)
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = sphere
        
        // Put our node into our scene view
        sceneView.scene.rootNode.addChildNode(node)
    }
    
}
