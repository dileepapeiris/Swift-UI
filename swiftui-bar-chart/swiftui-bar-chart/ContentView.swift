//
//  ContentView.swift
//  swiftui-bar-chart
//
//  Created by Dileepa Peiris on 2025-11-24.
//

import SwiftUI
import Charts

// Data structure for the displayed data
struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Int
}

// Data source
let monthlySales: [SalesData] = [
    SalesData(month: "Jan", sales: 200),
    SalesData(month: "Feb", sales: 150),
    SalesData(month: "March", sales: 180),
    SalesData(month: "April", sales: 250),
    SalesData(month: "May", sales: 300)
]

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
