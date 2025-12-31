import SwiftUI

struct Pie3DView: View {
    var data: [ChartData]
    @State private var rotation: Double = 45
    
    var body: some View {
        VStack {
            Text("3D Pie Chart")
                .font(.title2).bold()
                .padding(.top)
            
            Spacer()
            
            ZStack {
                ForEach(0..<data.count, id: \.self) { index in
                    PieSlice3D(
                        startAngle: startAngle(for: index),
                        endAngle: endAngle(for: index),
                        color: data[index].color
                    )
                }
            }
            .frame(width: 300, height: 300)
            .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 0, z: 0))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        rotation = Double(max(0, min(80, 45 + value.translation.height / 5)))
                    }
            )
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(data) { item in
                    HStack {
                        Circle().fill(item.color).frame(width: 12, height: 12)
                        Text(item.category).font(.subheadline)
                        Spacer()
                        Text("\(Int(item.value))%").font(.subheadline).bold()
                    }
                }
            }
}
