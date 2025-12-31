import SwiftUI
import SceneKit

struct Surface3DView: View {
    var body: some View {
        VStack {
            Text("3D Surface Plot")
                .font(.title2).bold()
                .padding(.top)
            
            SceneView(
                scene: createScene(),
                pointOfView: nil,
                options: [.allowsCameraControl, .autoenablesDefaultLighting]
            )
            .edgesIgnoringSafeArea(.all)
            .background(Color.black)
            .overlay(
                VStack {
                    Spacer()
                    Text("Interactive SceneKit Surface - Rotate/Zoom with gestures")
                        .font(.caption)
                        .padding()
                        .background(Color(.systemBackground).opacity(0.7))
                        .cornerRadius(10)
                        .padding()
                }
            )
        }
    }
    
    private func createScene() -> SCNScene {
        let scene = SCNScene()
        
        // Add a floor or base
        let surfaceNode = SCNNode()
        let size: Int = 20
        let step: Float = 0.5
        
        for i in 0..<size {
            for j in 0..<size {
                let x = Float(i) * step - Float(size) * step / 2
                let z = Float(j) * step - Float(size) * step / 2
                
                // Mathematical function: sin(x) * cos(z) for a wave effect
                let y = sin(x) * cos(z)
                
                let box = SCNBox(width: CGFloat(step), height: CGFloat(abs(y) + 0.1), length: CGFloat(step), chamferRadius: 0.02)
                
                // Color based on height
                let hue = CGFloat((y + 1) / 2) * 0.7 + 0.5 // From blue to purple/pink
                box.firstMaterial?.diffuse.contents = Color(hue: hue, saturation: 0.8, brightness: 1.0)
                
                let node = SCNNode(geometry: box)
                node.position = SCNVector3(x, Float(y)/2, z)
                surfaceNode.addChildNode(node)
            }
        }
        
        scene.rootNode.addChildNode(surfaceNode)
        
        // Add a camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 10, y: 10, z: 10)
        cameraNode.look(at: SCNVector3(0, 0, 0))
    }
