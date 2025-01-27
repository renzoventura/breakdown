//
//  TaskListView.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    @State private var newTitle : String = ""
    @State private var showingAddTodo = false

    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                HStack {
                    Text("Hello User").font(FontStyles.subtitle)
                    Spacer()
                }
                HStack {
                    Text("Your Projects (\(viewModel.tasks.count))").font(FontStyles.largeTitle)
                    Spacer()
                    showCreateNewTaskButton {
                        showingAddTodo = true
                    }
                }
                ListOfTasksComponents()
                Spacer()
            }.padding(16)
        }.sheet(isPresented: $showingAddTodo) {
            AddTaskView()
        }
    }
}

#Preview {
    TaskListView().environmentObject(mockViewModel)
}
