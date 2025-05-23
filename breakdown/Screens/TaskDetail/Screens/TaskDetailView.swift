//
//  TaskDetailView.swift
//  breakdown
//
//  Created by Renzo on 19/1/2025.
//

import SwiftUI

struct TaskDetailView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    let taskId: UUID
    
    private var task: Task? {
        return viewModel.getTaskById(withId: taskId)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let $task = task {
                    HStack {
                        Text($task.title)
                            .multilineTextAlignment(.leading)
                            .font(FontStyles.headline)
                        Spacer()
                    }
                    .padding(.bottom, 4)
                    
                    ProgressView(value: $task.calculateProgress())
                        .progressViewStyle(LinearProgressViewStyle())
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .padding(.vertical, 3)
                        .accentColor(.black)
                    
                    HStack {
                        HStack(alignment: .bottom) {
                            Text("\($task.getProgressOfSubTasks())")
                                .font(FontStyles.caption)
                        }
                        Spacer()
                        Text("\(String($task.calculatePercentage()))%")
                            .font(FontStyles.caption)
                    }
                    ListOfSubTasks()
                } else {
                    VStack {
                        Spacer()
                        Text("No Task Selected")
                            .font(FontStyles.body)
                            .foregroundColor(.gray)
                        Spacer()
                    }
    
                }
                
                Spacer()
            }
            .padding()
        }.accentColor(.black)
    }
}

#Preview {
    TaskDetailView(taskId: mockViewModel.tasks.first!.id).environmentObject(mockViewModel)
}

