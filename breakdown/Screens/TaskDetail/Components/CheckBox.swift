//
//  CheckBox.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import SwiftUI


struct CustomCheckbox: View {
    var isChecked: Bool
    var action: () -> Void
    var body: some View {
        HStack {
            Button(action: action) {
                ZStack {
                    Circle()
                        .strokeBorder(Color.gray, lineWidth: 2)
                        .background(Circle().fill(isChecked ? Color.blue : Color.white))
                        .frame(width: 24, height: 24)
                    if isChecked {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }
                }
            }
        }
    }
}
