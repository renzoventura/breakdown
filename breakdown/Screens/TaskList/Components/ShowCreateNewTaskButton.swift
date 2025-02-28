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
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(.white)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(.black, lineWidth: 3)
                )
         }
    }
}
 
