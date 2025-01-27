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
        Task(title: "Sample Task 1",
             subTasks:  [
                Task(title: "Sub Task 1"),
                Task(title: "Sub Task 2"),
                Task(title: "Sub Task 3"),
             ]
            ),
        Task(title: "Sample Task 2", isDone: true),
        Task(title: "Another Sample Task")
    ]
    return viewModel
}()
