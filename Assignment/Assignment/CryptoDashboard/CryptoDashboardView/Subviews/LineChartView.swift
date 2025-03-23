//
//  LineChartView.swift
//  Assignment
//
//  Created by Hassan Azhar on 21/03/2025.
//

import SwiftUI
import Charts

struct LineChartView: View {
    let prices: [Double]

    var body: some View {
        Chart {
            ForEach(prices.indices, id: \.self) { index in
                LineMark(
                    x: .value("Time", index),
                    y: .value("Price", prices[index])
                )
                .interpolationMethod(.catmullRom) 
                .foregroundStyle(prices.last ?? 0 >= prices.first ?? 0 ? .green : .red)
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .frame(height: 20)
        .padding(.horizontal, 10)
    }
}

