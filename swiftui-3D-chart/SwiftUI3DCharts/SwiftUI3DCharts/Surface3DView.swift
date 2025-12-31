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
    }
