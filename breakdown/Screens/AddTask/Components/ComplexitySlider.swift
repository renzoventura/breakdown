//
//  ComplexitySlider.swift
//  breakdown
//
//  Created by Renzo on 19/2/2025.
//

import SwiftUI
struct ComplexitySlider: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    @State private var sliderValue: Double = 0.0

    var body: some View {
        HStack {
            Text("Minimal")
            Slider(
                value: $sliderValue,
                in: 0...2,
                step: 1,
                onEditingChanged: { _ in
                    viewModel.currentSelectedComplexityItem = listOfComplexityItems[Int(sliderValue)]
                }
            )
            .padding()
            Text("Complex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
