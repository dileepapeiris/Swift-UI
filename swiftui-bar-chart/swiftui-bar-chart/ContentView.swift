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
            Text("Monthly Sales Report")
                .font(.title)
                .padding()

            // Chart
            Chart {
               // Loop
                ForEach(monthlySales) { data in
                    BarMark(
                        // X-axis
                        x: .value("Month", data.month),
                        // Y-axis
                        y: .value("Sales", data.sales)
                    )
                    // Chart stylings
                    .foregroundStyle(.blue.gradient)
                    
                }
            }
            .chartXAxisLabel("Month") // X-axis title
            .chartYAxisLabel("Sales") // Y-axis title
            .frame(height: 300) // Height of the chart
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
