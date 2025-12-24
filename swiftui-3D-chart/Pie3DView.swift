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
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)).shadow(radius: 2))
            .padding()
        }
    }
    
    private func startAngle(for index: Int) -> Angle {
        let total = data.map { $0.value }.reduce(0, +)
        let sum = data.prefix(index).map { $0.value }.reduce(0, +)
        return .degrees(sum / total * 360)
    }
    
    private func endAngle(for index: Int) -> Angle {
        let total = data.map { $0.value }.reduce(0, +)
        let sum = data.prefix(index + 1).map { $0.value }.reduce(0, +)
        return .degrees(sum / total * 360)
    }
}

struct PieSlice3D: View {
    let startAngle: Angle
    let endAngle: Angle
    let color: Color
    let depth: CGFloat = 30
    
    var body: some View {
        ZStack {
            // Extrusion (Sides)
            ForEach(0..<Int(depth), id: \.self) { i in
                PieSliceShape(startAngle: startAngle, endAngle: endAngle)
                    .fill(color.opacity(0.6))
                    .offset(z: -CGFloat(i))
            }
            
            // Top Face
            PieSliceShape(startAngle: startAngle, endAngle: endAngle)
                .fill(color)
                .shadow(radius: 2)
        }
    }
}

struct PieSliceShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        return path
    }
}

#Preview {
    Pie3DView(data: ChartData.mockPieData)
}
