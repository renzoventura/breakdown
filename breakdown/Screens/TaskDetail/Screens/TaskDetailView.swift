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
                    Text(task.title)
                        .multilineTextAlignment(.leading)
                        .font(FontStyles.headline)
                    Spacer()
                }.padding(.bottom, 4)
                ProgressView(value: task.calculateProgress())
                    .progressViewStyle(LinearProgressViewStyle())
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.vertical, 3)
                    .accentColor(.black)
                HStack {
                    HStack(alignment: .bottom) {
                        Text("\(task.getProgressOfSubTasks())")
                            .font(FontStyles.caption)
                    }
                    Spacer()
                    Text("\(String(task.calculatePercentage()))%")
                        .font(FontStyles.caption)
                }
                ScrollView {
                    VStack (spacing: 12){
                        ForEach(task.subTasks.indices, id: \.self) { index in
                            SubTaskView(subTask: $task.subTasks[index], action: {
                                viewModel.toggleSubTask(withParentTaskId: task.id,
                                                        withSubTaskId: task.subTasks[index].id
                                )
                            })
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

