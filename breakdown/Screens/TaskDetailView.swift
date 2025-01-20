//
//  TaskDetailView.swift
//  breakdown
//
//  Created by Renzo on 19/1/2025.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    @EnvironmentObject var viewModel : TaskViewModel
    
    var body: some View {
        VStack {
            Text("THIS IS THE DETAILED VIEW")
            Text(task.title)
            Toggle(isOn: Binding(get: {task.isDone}, set: {_ in viewModel.toggleItem(withId: task.id)})) {
                NavigationLink(destination: TaskDetailView(task: viewModel.getTaskById(withId: task.id)!)) {
                    Text(task.title).strikethrough(task.isDone)
                }
            }
        }
    }
}

//#Preview {
//    TaskDetailView(task: Task(title: "This is a task")).environmentObject(TaskViewModel())
//}
