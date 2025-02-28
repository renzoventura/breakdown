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
        if viewModel.filteredList.isEmpty {
            VStack {
                Spacer()
                Text(viewModel.isCompletedFilter ? "No finished tasks," : "No tasks yet,")
                Text("Lets get to work!")
                Spacer()
            }
            .padding(.bottom, 16)
            .frame(height: .infinity)
        } else {
            ScrollView {
                ForEach(viewModel.filteredList) { task in
                    LazyVStack(alignment: .leading, content: {
                        NavigationLink(destination: TaskDetailView()) {
                            let isDone = task.isAllTasksDone()
                            VStack (alignment: .leading){
                                Text(task.title)
                                    .strikethrough(isDone)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .font(FontStyles.subtitleBold)
                                    .padding(.bottom, 2)
                                    .foregroundColor(isDone ? .gray : .black)
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
