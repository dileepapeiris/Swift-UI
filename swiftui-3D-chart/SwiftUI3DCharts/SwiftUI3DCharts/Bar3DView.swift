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
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(tilt), axis: (x: 1, y: 0, z: 0))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        rotation = Double(value.translation.width / 5)
                        tilt = Double(value.translation.height / 5)
                    }
            )
            
            Spacer()
            
