//
//  TaskListView.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject private var viewModel: TaskViewModel
    @State private var newTitle: String = ""
    @State private var showingAddTodo = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(alignment: .center) {
                    TaskListHeaderView()
                    FilterButtonsView()
                    if viewModel.tasks.isEmpty {
                        NoTaskYetView()
                    } else {
                        ListOfTasksComponents()
                    }
                }
                .padding(.horizontal, 8)

                Divider()

                HStack {
                    Spacer()
                    ShowCreateNewTaskButton {
                        viewModel.resetSliderItem()
                        showingAddTodo = true
                    }
                    Spacer()
                }
                .padding(.top, 8)
            }
            .tint(.black)
            .sheet(isPresented: $showingAddTodo) {
                AddTaskView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .presentationDetents([.medium])
            }
        }
    }
}


#Preview {
    TaskListView().environmentObject(mockViewModel)
}
