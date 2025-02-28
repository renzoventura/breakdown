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
            ForEach(viewModel.tasks) { task in
                LazyVStack(alignment: .leading, content: {
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        VStack (alignment: .leading){
                            Text(task.title).strikethrough(task.isDone)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .font(FontStyles.subtitleBold)
                                .padding(.bottom, 2)
                            Text(task.getFormattedDate())
                                .font(FontStyles.smallCaption)
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
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(greyColor, lineWidth: 1))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 0.2)

                }).padding(.vertical, 3)
                    .frame(maxWidth: .infinity)
        }

        }
    }
}
