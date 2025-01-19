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
                    Text("Hello User")
                    Spacer()
                }
                Text("Your Tasks (4)")
                Text("This is your list of tasks")
                Button(action: {
                    showingAddTodo = true
                }) {
                    Text("Create a to do item")
                }
                ForEach(viewModel.tasks) { task in
                    HStack {
                        //LEARN WHATS HAPPENING -
                        //Binding get set??
                        //the function being passed {} (anon function?)
                        Toggle(isOn: Binding(get: {task.isDone}, set: {_ in viewModel.toggleItem(withId: task.id)})) {
                            NavigationLink(destination: TaskDetailView(task: $task)) {
                                Text(task.title).strikethrough(task.isDone)
                            }
                        }
                    }
                }
                Spacer()
            }.padding(16)
        }.sheet(isPresented: $showingAddTodo) {
            AddTaskView()
        }
    }
}

#Preview {
    TaskListView().environmentObject(TaskViewModel())
}
