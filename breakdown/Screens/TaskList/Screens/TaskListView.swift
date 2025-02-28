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
        VStack (spacing: 0){
            NavigationView {
                VStack (alignment: .center) {
                    HStack {
                        Text("Hello User").font(FontStyles.subtitle)
                        Spacer()
                    }
                    HStack {
                        Text("Your Projects (\(viewModel.tasks.count))").font(FontStyles.largeTitle)
                        Spacer()
              
                    }
                    if viewModel.tasks.isEmpty {
                        VStack {
                            Spacer()
                            Text("No tasks")
                            Text("yet...")
                            Spacer()
                        }
                    } else {
                        ListOfTasksComponents()
                        
                        
                    }
  
                }
                    .padding(.horizontal, 8)
            }.sheet(isPresented: $showingAddTodo) {
                AddTaskView()
            }
            Divider()
            HStack {
                Spacer()
                ShowCreateNewTaskButton {
                    viewModel.resetSliderItem()
                    showingAddTodo = true
                }
                
                Spacer()
            }.padding(.top, 8)
        }

    }
}

#Preview {
    TaskListView().environmentObject(mockViewModel)
}
