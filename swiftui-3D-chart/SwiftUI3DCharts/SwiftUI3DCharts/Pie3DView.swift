import SwiftUI

struct Pie3DView: View {
    var data: [ChartData]
    @State private var rotation: Double = 45
    
    var body: some View {
        VStack {
            Text("3D Pie Chart")
                .font(.title2).bold()
                .padding(.top)
}
