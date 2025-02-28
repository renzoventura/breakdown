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

let mockTasks : [Task] = smallMocks

let smallMocks: [Task] = [
    swiftUIExample,
    Task(
        title: "Prepare for Presentation",
        subTasks: [
            Task(title: "Create Slides"),
            Task(title: "Rehearse Talk"),
        ]
    ),
    Task(
        title: "Organize Workspace",
        subTasks: [
            Task(title: "Declutter Desk", isDone: true),
            Task(title: "Sort Cables", isDone: true),
            Task(title: "Clean Keyboard and Monitor", isDone: true),
        ]
    ),
]

let multipleMocks: [Task] = [
    swiftUIExample,
    Task(
        title: "Prepare for Presentation",
        subTasks: [
            Task(title: "Create Slides", isDone: true),
            Task(title: "Rehearse Talk", isDone: true),
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

var listOfExamples: [String] = [
    "Prepare a compelling client presentation with structured slides, key talking points, and engaging visuals to leave a lasting impression.",
    "Follow a structured 12-week training plan to build endurance, improve pace, and successfully complete a half marathon.",
    "Learn Swift programming from the basics and build a fully functional mobile app with interactive UI and backend integration.",
    "Declutter every room in your home by sorting, organizing, and optimizing space step by step for a cleaner and stress-free environment.",
    "Establish a consistent daily meditation and mindfulness practice to reduce stress, improve focus, and enhance overall well-being.",
    "Plan an affordable yet memorable trip to Japan, including itinerary, budget management, accommodations, and must-visit attractions."
]

var swiftUIExample =     Task(
    title: "Complete SwiftUI App",
    subTasks: [
        Task(title: "Design UI layout with SwiftUI, focusing on UX."),
        Task(title: "Implement core features like data fetching and navigation."),
        Task(title: "Test each feature to ensure proper functionality."),
        Task(title: "Write unit tests for key functions."),
        Task(title: "Fix UI bugs (layout, alignment, visuals)."),
        Task(title: "Document codebase, architecture, and usage."),
        Task(title: "Set up Git with proper branching strategy."),
        Task(title: "Integrate backend API for data and auth."),
        Task(title: "Implement user authentication (Firebase/OAuth)."),
        Task(title: "Create user profile screen for editing info."),
        Task(title: "Design a custom app icon."),
        Task(title: "Set up push notifications."),
        Task(title: "Develop a settings screen for preferences."),
        Task(title: "Add dark mode support."),
        Task(title: "Create SwiftUI animations for better UX."),
        Task(title: "Optimize performance (memory, speed, responsiveness)."),
        Task(title: "Test app on various simulators and devices."),
        Task(title: "Prepare app for App Store submission."),
        Task(title: "Deploy app to App Store with proper metadata."),
        Task(title: "Monitor feedback and improve app post-launch.")
    ]
)
