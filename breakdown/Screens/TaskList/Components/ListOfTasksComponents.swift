//
//  ListOfTasksComponents.swift
//  breakdown
//
//  Created by Renzo on 27/1/2025.
//

import SwiftUI

struct ListOfTasksComponents: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    
    private var filteredTasks: [Task] {
        viewModel.tasks.filter { task in
            if viewModel.isCompletedFilter {
                return task.isAllTasksDone()
            } else {
                return !task.isAllTasksDone()
            }
        }
    }
    
    var body: some View {
        if filteredTasks.isEmpty {
            VStack {
                Spacer()
                Text(viewModel.isCompletedFilter ? "No finished tasks" : "No tasks yet")
                    .font(FontStyles.boldBody)
                Text("Lets get to work!")
                    .font(FontStyles.boldBody)
                Spacer()
            }
            .padding(.bottom, 16)
//            .frame(height: .infinity)
        } else {
            ScrollView {
                ForEach(filteredTasks) { task in
                    LazyVStack(alignment: .leading, content: {
                        NavigationLink(
                            destination: TaskDetailView(taskId: task.id)
                        ) {
                            let isDone = task.isAllTasksDone()
                            VStack (alignment: .leading) {
                                HStack {
                                    Text(task.title)
                                        .strikethrough(isDone)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(FontStyles.subtitleBold)
                                        .padding(.bottom, 2)
                                        .foregroundColor(isDone ? .gray : .black)
                                    
                                    Menu {
                                        Button(role: .destructive) {
                                            // Delete task
                                            if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                                                viewModel.tasks.remove(at: index)
                                            }
                                        } label: {
                                            Label("Delete Task", systemImage: "trash")
                                        }
                                        
                                        Button {
                                            // Reset all subtasks
                                            if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                                                viewModel.tasks[index].subTasks = viewModel.tasks[index].subTasks.map { subtask in
                                                    var updatedSubtask = subtask
                                                    updatedSubtask.isDone = false
                                                    return updatedSubtask
                                                }
                                            }
                                        } label: {
                                            Label("Reset Progress", systemImage: "arrow.counterclockwise")
                                        }
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                            .padding(8)
                                    }
                                }
                                
                                HStack {
                                    Text(task.getFormattedDate())
                                        .font(FontStyles.smallCaption)
                                    Spacer()
                                    if isDone {
                                        Text("\(String(task.subTasks.count)) Tasks")
                                            .font(FontStyles.smallCaption)
                                    }
                                }
                                if !isDone {
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
                                }
                            }
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(greyColor, lineWidth: 3)
                            )
                            .contentShape(Rectangle())
                            .transition(.move(edge: .trailing))
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.setCurrentSelectedTask(withSelectedTask: task)
                        })
                        .cornerRadius(8)
                        .buttonStyle(PlainButtonStyle())
                    })
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
