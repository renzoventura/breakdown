//
//  TaskListView.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTitle : String = ""
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                HStack {
                    Text("Hello User")
                    Spacer()
                }
                Text("Your Tasks (4)")
                Text("This is your list of tasks")
                
                TextField("Create your task", text: $newTitle)
                Button(action: {
                    if(!newTitle.isEmpty) {
                        viewModel.addTask(newTitle)
                        newTitle = ""
                    } else {
                        print("ERROR")
                    }
                }) {
                    Text("add")
                }
                ForEach(viewModel.tasks) { task in
                    HStack {
                        //LEARN WHATS HAPPENING -
                        //Binding get set
                        //the function being passed {} (anon function?)
                        Toggle(isOn: Binding(get: {task.isDone}, set: {_ in viewModel.toggleItem(withId: task.id)})) {
                            Text(task.title).strikethrough(task.isDone)
                        }
                    }
                }
                Spacer()
            }.padding(16)
        }
    }
}

#Preview {
    TaskListView()
}
