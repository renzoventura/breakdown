//
//  ListOfSubTasks.swift
//  breakdown
//
//  Created by Renzo on 1/3/2025.
//

import SwiftUI

struct ListOfSubTasks: View {
    @EnvironmentObject private var viewModel: TaskViewModel
    var body: some View {
        
        // Safely unwrap the list of subtasks
        if let listOfSubTasks = viewModel.currentSelectedTask?.subTasks {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(Array(listOfSubTasks.enumerated()), id: \.offset) { index, subtask in
                        // Use the subtask directly here
                        //THIS Binding(get: { subtask }, set: { _ in }) i still do not understand lol
                        SubTaskView(subTask: Binding(get: { subtask }, set: { _ in })) {
                            viewModel.toggleSubTask(withSubTaskId: Binding(get: { subtask }, set: { _ in }).id)
                        }
                    }
                }
            }
        } else {
            // Handle the case where listOfSubTasks is nil
            Text("No subtasks available.")
        }
    }
}

#Preview {
    ListOfSubTasks()
}
