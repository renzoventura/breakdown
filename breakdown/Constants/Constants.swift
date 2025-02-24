//
//  Constants.swift
//  breakdown
//
//  Created by Renzo on 22/2/2025.
//

import Foundation

let listOfComplexityItems: [ComplexitySliderItem] = [
    ComplexitySliderItem(title: "Minimal", numberOfItems: 3),
    ComplexitySliderItem(title: "Simple", numberOfItems: 5),
    ComplexitySliderItem(title: "Average", numberOfItems: 8),
    ComplexitySliderItem(title: "Moderate", numberOfItems: 10),
    ComplexitySliderItem(title: "Complex", numberOfItems: 13),
    ComplexitySliderItem(title: "Intricate", numberOfItems: 15),
    ComplexitySliderItem(title: "Extreme", numberOfItems: 20)
]

let mockTasks: [Task] = [
    Task(
        title: "Complete SwiftUI App",
        subTasks: [
            Task(title: "Design UI"),
            Task(title: "Implement Features"),
            Task(title: "Test Functionality"),
        ]
    ),
    Task(
        title: "Prepare for Presentation",
        subTasks: [
            Task(title: "Create Slides"),
            Task(title: "Rehearse Talk"),
        ]
    ),
]

