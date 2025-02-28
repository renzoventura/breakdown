//
//  ShowCreateNewTaskButton.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//
import SwiftUI

struct ShowCreateNewTaskButton: View {
    var action: () -> Void //Callback closeure
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blue)  // Change plus icon color to blue
                .frame(width: 40, height: 40)
                .background(.white)  // Background color is white
                .clipShape(Circle())  // Make the button circular
                .overlay(                // Blue border around the circle
                    Circle().stroke(Color.blue, lineWidth: 3)
                )
//                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)  // Optional shadow for effect
        }
    }
}
 
