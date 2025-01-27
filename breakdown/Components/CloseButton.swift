//
//  CloseButton.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

 import SwiftUI

struct CloseButton: View {
    var action: () -> Void //Callback closeure
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
            
        }
    }
}
