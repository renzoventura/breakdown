//
//  SubTaskView.swift
//  breakdown
//
//  Created by Renzo on 28/2/2025.
//

import SwiftUI

struct SubTaskView: View {
    @Binding var subTask: Task
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                CustomCheckbox(isChecked: $subTask.isDone)
                Text(subTask.title)
                    .strikethrough(subTask.isDone)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 8)
                    .foregroundColor(.black) // Set the color explicitly
                    .font(FontStyles.body)
                Spacer()
            }   .frame(height: 60)
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                )
                .cornerRadius(10)
                .font(FontStyles.body)
        }
    }
}
