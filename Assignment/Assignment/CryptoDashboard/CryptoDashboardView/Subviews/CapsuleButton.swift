//
//  CapsuleButton.swift
//  Assignment
//
//  Created by Hassan Azhar on 22/03/2025.
//

import SwiftUI

struct CapsuleButton: View {
    var text: String
    var backgroundColor: Color
    var textColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(textColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .frame(height: 28)
            .background(
                Capsule()
                    .fill(backgroundColor)
            )
    }
}

