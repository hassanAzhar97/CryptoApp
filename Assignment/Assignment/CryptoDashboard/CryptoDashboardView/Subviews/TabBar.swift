//
//  TabBar.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            TabBarButton(icon: "house.fill", tab: 0, selectedTab: $selectedTab)
            Spacer()
            TabBarButton(icon: "chart.bar.fill", tab: 1, selectedTab: $selectedTab)
            
            Spacer()
            
            Button(action: {
                selectedTab = 2
            }) {
                Image(systemName: "arrow.left.arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .background(Color.green)
                    .clipShape(Circle())
            }
            
            Spacer()
            
            TabBarButton(icon: "chart.line.uptrend.xyaxis", tab: 3, selectedTab: $selectedTab)
            Spacer()
            TabBarButton(icon: "gearshape.fill", tab: 4, selectedTab: $selectedTab)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
    }
}

struct TabBarButton: View {
    let icon: String
    let tab: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(selectedTab == tab ? .green : .gray)
        }
    }
}
