//
//  CheckBox.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isChecked ? Color.black : Color.white)
                .frame(width: 24, height: 24)
                .clipShape(RoundedRectangle(cornerRadius: 5)) // Clip the shape
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isChecked ? .black : .gray, lineWidth: 4)
                )
            if isChecked {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(FontStyles.calloutBold)
            }
        }.cornerRadius(5)
    }
}
