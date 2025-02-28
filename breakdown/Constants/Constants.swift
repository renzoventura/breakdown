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
            Task(title: "Design the user interface layout with SwiftUI components, considering user experience (UX) best practices."),
            Task(title: "Implement core app features such as data fetching, user interaction, and navigation."),
            Task(title: "Test functionality of each feature to ensure the app behaves as expected."),
            Task(title: "Write unit tests for the critical functions to ensure app stability and prevent future bugs."),
            Task(title: "Identify and fix UI bugs related to layout issues, component alignment, and visual inconsistencies."),
            Task(title: "Write comprehensive documentation explaining the codebase, architecture, and usage instructions for future developers."),
            Task(title: "Set up the Git repository, ensuring proper branching strategies and version control workflows."),
            Task(title: "Integrate with the app’s backend API for data fetching and user authentication, ensuring secure connections."),
            Task(title: "Implement user authentication using Firebase or OAuth, enabling secure sign-in/sign-up functionality."),
            Task(title: "Create the user profile screen where users can view and edit their personal information."),
            Task(title: "Design a custom app icon that aligns with the branding and theme of the app."),
            Task(title: "Set up push notifications for updates, alerts, or user interaction prompts."),
            Task(title: "Develop a settings screen where users can manage preferences, notifications, and privacy settings."),
            Task(title: "Add dark mode support, ensuring all components adapt appropriately to a dark theme."),
            Task(title: "Write SwiftUI animations to enhance the app’s interactivity and user engagement, such as button presses and screen transitions."),
            Task(title: "Test the app’s performance to ensure smooth operation, including memory usage, loading times, and responsiveness."),
            Task(title: "Debug and test the app on various simulators and real devices to identify and resolve platform-specific issues."),
            Task(title: "Prepare the app for App Store submission by ensuring it meets Apple’s guidelines and requirements."),
            Task(title: "Deploy the app to the App Store, ensuring proper metadata, screenshots, and submission forms are completed."),
            Task(title: "Monitor user feedback through reviews, analytics, and crash reports to address any issues and improve app performance.")
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
