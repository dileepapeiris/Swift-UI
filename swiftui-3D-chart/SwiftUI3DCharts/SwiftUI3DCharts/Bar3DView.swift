import SwiftUI

struct Bar3DView: View {
    var data: [ChartData]
    @State private var rotation: Double = -15
    @State private var tilt: Double = 15
    
    var body: some View {
        VStack {
            Text("3D Bar Chart")
                .font(.title2).bold()
                .padding(.top)
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(data) { item in
                    Bar3D(value: item.value, color: item.color)
                        .frame(width: 40)
                }
            }
