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
            HStack {
                Text(task.title).font(FontStyles.largeTitle)
                Spacer()
            }
            Spacer()
            Toggle(isOn: Binding(get: {task.isDone}, set: {_ in viewModel.toggleItem(withId: task.id)})) {
                NavigationLink(destination: TaskDetailView(task: viewModel.getTaskById(withId: task.id)!)) {
                    Text(task.title).strikethrough(task.isDone)
                }
            }
            ForEach(task.subTasks) { subTask in
                Toggle(isOn: Binding(get: {subTask.isDone}, set: { _ in  })) {
                        Text(subTask.title).strikethrough(task.isDone)
                    
                }
            }
            Spacer()
        }.padding(16)
    }
}

#Preview {
    TaskDetailView(task: mockViewModel.tasks.first!).environmentObject(mockViewModel)
}
