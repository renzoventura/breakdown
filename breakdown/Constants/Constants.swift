//
//  Constants.swift
//  breakdown
//
//  Created by Renzo on 22/2/2025.
//

import Foundation

let listOfComplexityItems : [ComplexitySliderItem] = [
    ComplexitySliderItem(title: "Minimal", numberOfItems: 3),
    ComplexitySliderItem(title: "Average", numberOfItems: 5),
    ComplexitySliderItem(title: "Complex", numberOfItems: 10),
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
