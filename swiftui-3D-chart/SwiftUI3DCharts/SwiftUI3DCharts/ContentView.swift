import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("SwiftUI 3D Transforms")) {
                    NavigationLink(destination: Bar3DView(data: ChartData.mockBarData)) {
                        Label("3D Bar Chart", systemImage: "chart.bar.fill")
                    }
                    
                    NavigationLink(destination: Pie3DView(data: ChartData.mockPieData)) {
                        Label("3D Pie Chart", systemImage: "chart.pie.fill")
                    }
                }
                
                Section(header: Text("SceneKit (Higher Fidelity)")) {
                    NavigationLink(destination: Surface3DView()) {
                        Label("3D Surface Plot", systemImage: "square.3.layers.3d.down.right")
                    }
                }
                
                Section(header: Text("Learning Resources")) {
                    Link(destination: URL(string: "https://developer.apple.com/documentation/swiftui/charts")!) {
                        Label("SwiftUI Charts Documentation", systemImage: "link")
                    }
                    Link(destination: URL(string: "https://developer.apple.com/documentation/scenekit")!) {
                        Label("SceneKit Documentation", systemImage: "link")
                    }
                }
            }
            .navigationTitle("Swift 3D Charts")
            .listStyle(InsetGroupedListStyle())
        }
    }
}
}
