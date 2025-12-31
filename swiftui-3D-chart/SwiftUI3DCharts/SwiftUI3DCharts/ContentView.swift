import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("SwiftUI 3D Transforms")) {
                    NavigationLink(destination: Bar3DView(data: ChartData.mockBarData)) {
                        Label("3D Bar Chart", systemImage: "chart.bar.fill")
                    }
                    
    }
}
}
