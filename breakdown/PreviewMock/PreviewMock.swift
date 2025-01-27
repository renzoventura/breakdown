//
//  PreviewMock.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import Foundation
import SwiftUI

// Global mock ViewModel for previews
let mockViewModel: TaskViewModel = {
    let viewModel = TaskViewModel()
    viewModel.tasks = [
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
        Task(title: "Read Swift Documentation"),
    ]
    return viewModel
}()
