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
    }
