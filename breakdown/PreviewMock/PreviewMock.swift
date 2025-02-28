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
    viewModel.tasks = multipleMocks
    return viewModel
}()
