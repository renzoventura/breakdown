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
                    // Sort the subtasks so that completed ones are at the bottom
                    let sortedSubTasks = listOfSubTasks.sorted { !$0.isDone && $1.isDone }
                    
                    ForEach(sortedSubTasks, id: \.id) { subtask in
                        // Check if the current subtask is the first completed one
                        if subtask.isDone && sortedSubTasks.first(where: { $0.isDone })?.id == subtask.id {
                            Text("Completed")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.top, 8) // Add some spacing above the separator
                        }
                        
                        SubTaskView(subTask: Binding(get: { subtask }, set: { _ in })) {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                viewModel.toggleSubTask(withSubTaskId: subtask.id)
                            }
                        }
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: subtask.isDone)
                        .id(subtask.id) // Important: gives SwiftUI a stable identity for animations
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
