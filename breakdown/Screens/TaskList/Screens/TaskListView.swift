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
                    TaskListHeaderView()
                    FilterButtonsView()
                    if viewModel.tasks.isEmpty {
                        NoTaskYetView()
                    } else {
                        ListOfTasksComponents()
                    }
  
                }
                    .padding(.horizontal, 8)
            }
            .tint(.black)
            .sheet(isPresented: $showingAddTodo) {
                AddTaskView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .presentationDetents([.medium])
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
