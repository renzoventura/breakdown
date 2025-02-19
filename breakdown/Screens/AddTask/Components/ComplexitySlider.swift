//
//  ComplexitySlider.swift
//  breakdown
//
//  Created by Renzo on 19/2/2025.
//

import SwiftUI
struct ComplexitySlider: View {
    @Binding var selectedIndex: Int

    @State private var sliderValue: Double = 0.0

    var body: some View {
        VStack {
            HStack {
                Text("Minimal")
                Slider(
                    value: $sliderValue,
                    in: 0...2,
                    step: 1,
                    onEditingChanged: { _ in
                        selectedIndex = Int(sliderValue)
                    }
                )
                .padding()
                Text("Complex")
            }
            Text("\(selectedIndex)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
