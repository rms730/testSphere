//
//  ViewController.swift
//  TestSphere
//
//  Created by Randy Sternke on 4/16/20.
//  Copyright © 2020 Randy Sternke. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var testSphereAnchor : Experience.TestSphere!
    var ball : (Entity & HasPhysics)? {
        testSphereAnchor?.ball as? Entity & HasPhysics
    }
    var kickButton : Entity? {
        testSphereAnchor?.kickButton
    }
    var restartButton : Entity? {
        testSphereAnchor?.restartButton
    }
    var target : Entity? {
        testSphereAnchor?.target
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAR()
    }
    
    func loadAR() {
        // Load the scene from the "Experience" Reality File
        Experience.loadTestSphereAsync { (result) in
            switch result {
            case .success(let anchor):
                self.testSphereAnchor = anchor
                self.arView.scene.anchors.append(self.testSphereAnchor)
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func didPressKickNowButton() {
        // establish downward force on the scene (gravity at 9.8 m/s^2)
        
        // establish side force on the scene (wind at ~10 kph)
        
        // establish upward force on the ball (spin effects)
        
        // establish drag force on the ball to slow the velocity
        
        // give ball backspin
//        ball?.addTorque(<#T##torque: SIMD3<Float>##SIMD3<Float>#>, relativeTo: <#T##Entity?#>)
        
        // kick ball at 80 kph towards the the direction of the target
        
        // make ball respond to above forces
        ball?.physicsBody?.mode = .kinematic
        
        // BONUS: the star moves to the ball with out moving along the z axis
        // ball sticks to star
        
    }
    
    func didPressRestartButton() {
        // scene resets for a new kick
    }
    
    
}
