//
//  TaskDetailView.swift
//  breakdown
//
//  Created by Renzo on 19/1/2025.
//

import SwiftUI

struct TaskDetailView: View {
    @State var task: Task
    @EnvironmentObject var viewModel : TaskViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(task.title).font(FontStyles.largeTitle)
                    Spacer()
                }.padding(.bottom, 4)
                 HStack {
                    Text("Tasks: ")
                    Text("\(task.getProgressOfSubTasks())")
                        .font(FontStyles.subtitle)
                    Spacer()
                }
                VStack {
                    ForEach(task.subTasks.indices, id: \.self) { index in
                        HStack {
                            CustomCheckbox(isChecked: $task.subTasks[index].isDone, action: {
                                viewModel.toggleSubTask(withParentTaskId: task.id,
                                                        withSubTaskId: task.subTasks[index].id
                                )
                            })
                            Text(task.subTasks[index].title).strikethrough(task.isDone)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    TaskDetailView(task: mockViewModel.tasks.first!).environmentObject(mockViewModel)
}
