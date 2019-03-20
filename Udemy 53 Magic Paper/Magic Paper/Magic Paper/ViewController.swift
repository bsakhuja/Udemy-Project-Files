//
//  ViewController.swift
//  Magic Paper
//
//  Created by Brian Sakhuja on 3/19/19.
//  Copyright © 2019 Brian Sakhuja. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import SpriteKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()

        // Track the harry potter image
        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "NewspaperImages", bundle: Bundle.main) {
            configuration.trackingImages = trackedImages
            configuration.maximumNumberOfTrackedImages = 1
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
        
       
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    // Gets called when harry potter image gets detected
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        // first overlay a rectangle
        
        // Create our parent node
        let node = SCNNode()
        
        // Check if the anchor is of type ARImageAnchor
        if let imageAnchor = anchor as? ARImageAnchor {
            let videoNode = SKVideoNode(fileNamed: "harrypotter.mp4")
            videoNode.play()

            let planeSize = imageAnchor.referenceImage.physicalSize
            
            // create the video scene from scene kit (2D)
            let videoScene = SKScene(size: CGSize(width: 1280, height: 720))
            
            // set the video to the center
            videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
            
            // flip upside down
            videoNode.yScale = -1
            
            videoScene.addChild(videoNode)
            
            
            
            let plane = SCNPlane(width: planeSize.width, height: planeSize.height)
            
            plane.firstMaterial?.diffuse.contents = videoScene
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi/2
            
            // Add the plane node to the node as a child
            node.addChildNode(planeNode)
        }
        
        return node
    }

}
