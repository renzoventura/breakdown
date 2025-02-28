//
//  FilterButton.swift
//  breakdown
//
//  Created by Renzo on 28/2/2025.
//

import SwiftUI

struct FilterButton: View {
    var toggled: Bool
    var text: String
    var onTap: () -> Void
    
    private let buttonWidth: CGFloat = 120
    private let buttonHeight: CGFloat = 40
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            Text(text)
                .font(FontStyles.boldBody)
                .frame(width: buttonWidth, height: buttonHeight) // Fixed width and height
                .background(toggled ? .black : Color.white)
                .foregroundColor(toggled ? .white : .gray)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(toggled ? Color.white : Color.gray, lineWidth: 1)
                )
                .scaleEffect(toggled ? 1.05 : 1.0) // Slight scale effect for toggled state
                .animation(.easeInOut(duration: 0.1), value: toggled)
        }
    }
}
