//
//  ComplexitySlider.swift
//  breakdown
//
//  Created by Renzo on 19/2/2025.
//

import SwiftUI
struct ComplexitySlider: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    @State private var sliderValue: Double = 1.0

    var body: some View {
        HStack {
            Text("😌").font(FontStyles.largeTitle)
            Slider(
                value: $sliderValue,
                in: 0...Double(listOfComplexityItems.count - 1) ,
                step: 1,
                onEditingChanged: { _ in
                    viewModel.currSelectedSliderItem = listOfComplexityItems[Int(sliderValue)]
                }
            ).accentColor(.black)  // Set the slider thumb and track color to black
                .frame(height: 50)
            Text("🤯").font(FontStyles.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
