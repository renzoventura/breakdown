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



let multipleMocks: [Task] = [
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
    Task(
        title: "Learn Swift Concurrency",
        subTasks: [
            Task(title: "Read Apple Documentation"),
            Task(title: "Implement Async/Await"),
            Task(title: "Try Task Groups"),
        ]
    ),
    Task(
        title: "Organize Workspace",
        subTasks: [
            Task(title: "Declutter Desk"),
            Task(title: "Sort Cables"),
            Task(title: "Clean Keyboard and Monitor"),
        ]
    ),
    Task(
        title: "Plan Weekend Getaway",
        subTasks: [
            Task(title: "Choose Destination"),
            Task(title: "Book Hotel"),
            Task(title: "Pack Essentials"),
        ]
    ),
    Task(title: "Write Blog Post"),
    Task(title: "Go for a 10K Run"),
    Task(
        title: "Update Resume",
        subTasks: [
            Task(title: "Revise Experience Section"),
            Task(title: "Update Skills"),
            Task(title: "Proofread"),
        ]
    ),
    Task(
        title: "Grocery Shopping",
        subTasks: [
            Task(title: "Make a List"),
            Task(title: "Buy Fruits and Vegetables"),
            Task(title: "Get Household Items"),
        ]
    ),
    Task(
        title: "Practice Guitar",
        subTasks: [
            Task(title: "Learn New Chords"),
            Task(title: "Play Favorite Song"),
        ]
    ),
    Task(
        title: "Read a Book",
        subTasks: [
            Task(title: "Choose a Book"),
            Task(title: "Read for 30 Minutes"),
        ]
    ),
    Task(title: "Meditate for 10 Minutes"),
    Task(
        title: "Fix Bugs in Project",
        subTasks: [
            Task(title: "Identify Issues"),
            Task(title: "Write Fixes"),
            Task(title: "Test Fixes"),
        ]
    ),
    Task(
        title: "Cook Dinner",
        subTasks: [
            Task(title: "Choose Recipe"),
            Task(title: "Prepare Ingredients"),
            Task(title: "Cook and Serve"),
        ]
    ),
    Task(title: "Call Parents"),
    Task(
        title: "Backup Important Files",
        subTasks: [
            Task(title: "Sort Documents"),
            Task(title: "Upload to Cloud"),
        ]
    ),
    Task(
        title: "Watch a Movie",
        subTasks: [
            Task(title: "Pick a Movie"),
            Task(title: "Prepare Snacks"),
        ]
    ),
    Task(title: "Plan Next Week's Schedule"),
    Task(
        title: "Start a New Side Project",
        subTasks: [
            Task(title: "Brainstorm Ideas"),
            Task(title: "Set Up Repo"),
            Task(title: "Write Initial Code"),
        ]
    )
]
