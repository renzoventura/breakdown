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
            VStack(alignment: .leading, content: {
                NavigationLink(destination: TaskDetailView(task: task)) {
                    Text(task.title).strikethrough(task.isDone)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(FontStyles.headline)
                }.padding(.bottom, 0.2)
                HStack(alignment: .bottom) {
                    Text("Tasks:")
                        .font(FontStyles.subtitle)
                    Text("\(task.getProgressOfSubTasks())")
                        .font(FontStyles.subtitleBold)
                }
                Text(task.getFormattedDate())
            }).padding(.vertical, 3)
        }
    }
}
