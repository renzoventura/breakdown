//
//  TaskViewModel.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

class TaskViewModel : ObservableObject {
    @Published var tasks: [Task] = [
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
    
    func addTask(_ title: String) {
        let newTasks = Task(title: title)
        tasks.append(newTasks)
    }
    
    func toggleTask(withId id: UUID) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].isDone.toggle()
        }
    }
    
    func getTaskById(withId id: UUID) -> Task? {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            return tasks[index];
        } else {
            return nil;
        }
    }
    
    func toggleSubTask(withParentTaskId parentTaskId: UUID, withSubTaskId subTaskId: UUID) {
        if let parentTaskIndex = tasks.firstIndex(where: { $0.id == parentTaskId }) {
            let parentTask = tasks[parentTaskIndex]  // Create a mutable copy of the task cannot just use if var
            if let subTaskIndex = parentTask.subTasks.firstIndex(where: { $0.id == subTaskId }) {
                parentTask.subTasks[subTaskIndex].isDone.toggle()
                tasks[parentTaskIndex] = parentTask  // Update the tasks array
            }
        }
    }
    
}
