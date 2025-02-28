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
                .frame(width: 30, height: 30)
                .background(.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 1))
        }
    }
}
