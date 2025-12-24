import Foundation
import SwiftUI

struct ChartData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
    let color: Color
}

extension ChartData {
    static let mockBarData: [ChartData] = [
        ChartData(category: "Jan", value: 45, color: .purple),
        ChartData(category: "Feb", value: 72, color: .blue),
        ChartData(category: "Mar", value: 58, color: .cyan),
        ChartData(category: "Apr", value: 91, color: .green),
        ChartData(category: "May", value: 65, color: .orange)
    ]
    
    static let mockPieData: [ChartData] = [
        ChartData(category: "Product A", value: 35, color: .pink),
        ChartData(category: "Product B", value: 25, color: .orange),
        ChartData(category: "Product C", value: 40, color: .purple)
    ]
}

struct SurfacePoint: Identifiable {
    let id = UUID()
    let x: Float
    let y: Float
    let z: Float
}
