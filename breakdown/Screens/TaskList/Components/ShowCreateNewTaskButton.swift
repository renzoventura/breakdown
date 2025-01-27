//
//  ShowCreateNewTaskButton.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//
import SwiftUI

struct showCreateNewTaskButton: View {
    var action: () -> Void //Callback closeure
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color.blue)
                .clipShape(Circle())
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
        }
    }
}
