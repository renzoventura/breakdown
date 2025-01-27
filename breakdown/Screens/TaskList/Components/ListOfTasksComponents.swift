//
//  ListOfTasksComponents.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import SwiftUI

struct ListOfTasksComponents: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    var body: some View {
        ForEach(viewModel.tasks) { task in
            HStack {
                Toggle(isOn: Binding(get: {task.isDone}, set: {_ in viewModel.toggleTask(withId: task.id)})) {
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        Text(task.title).strikethrough(task.isDone).frame(maxWidth: .infinity, alignment: .leading).multilineTextAlignment(.leading)
                    }
                }
                Text("SubTasks:")
                HStack {
                    Text("\(task.getNumberOfSubTasksDone())")
                    Text("/")
                    Text("\(task.getNumberOfSubTasks())")
                }
            }
        }
    }
}
