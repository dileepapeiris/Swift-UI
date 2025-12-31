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
    }
