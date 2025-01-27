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
        NavigationView {
            VStack {
                HStack {
                    Text(task.title).font(FontStyles.largeTitle)
                    Spacer()
                }
                VStack {
                    ForEach(task.subTasks) { subTask in
                        HStack {
                            CustomCheckbox(isChecked: subTask.isDone, action: {})
                            Text(subTask.title).strikethrough(task.isDone)
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.padding(16)
        }
    }
}

#Preview {
    TaskDetailView(task: mockViewModel.tasks.first!).environmentObject(mockViewModel)
}
