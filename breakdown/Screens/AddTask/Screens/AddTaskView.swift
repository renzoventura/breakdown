//
//  AddTaskView.swift
//  breakdown
//
//  Created by Renzo on 19/1/2025.
//

import SwiftUI

struct AddTaskView: View {
    //what is this code doing? @Environment the (/ etc)
    @Environment(\ .presentationMode) var presentationMode
    @State private var newTitle = "";
    @EnvironmentObject private var viewModel : TaskViewModel
    
    var body: some View {
        VStack {
            TextField("Create your task", text: $newTitle)
            Button(action: {
                if(!newTitle.isEmpty) {
                    viewModel.addTask(newTitle)
                    newTitle = ""
                    presentationMode.wrappedValue.dismiss()
                } else {
                    print("ERROR")
                }
            }) {
                Text("add")
            }
        }
    }
}

#Preview {
    AddTaskView().environmentObject(mockViewModel)
}
