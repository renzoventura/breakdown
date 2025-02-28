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
        ScrollView {
            ForEach(viewModel.filteredList) { task in
                LazyVStack(alignment: .leading, content: {
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        let isDone = task.isAllTasksDone()
                        VStack (alignment: .leading){
                            Text(task.title)
                                .strikethrough(isDone)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .font(FontStyles.subtitleBold)
                                .padding(.bottom, 2)
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
                                HStack {
                                    HStack(alignment: .bottom) {
                                        Text("\(task.getProgressOfSubTasks())")
                                            .font(FontStyles.body)
                                    }
                                    Spacer()
                                    Text("\(String(task.calculatePercentage()))%")
                                }
                            }
                        }
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
//                            .stroke(isDone ? .blue : greyColor, lineWidth: 3)
                            .stroke(greyColor, lineWidth: 3)
                        )
//                        .foregroundColor(isDone ? .blue : .black)
                        .contentShape(Rectangle())
                        .transition(.move(edge: .trailing))
                    }
                    .cornerRadius(8)
                    .buttonStyle(PlainButtonStyle())
 
                })
                    .frame(maxWidth: .infinity)
        }

        }
    }
}
