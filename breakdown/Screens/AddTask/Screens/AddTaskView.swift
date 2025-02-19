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
    @State var errorMessage : String?
    @EnvironmentObject private var viewModel : TaskViewModel
    @State private var selectedIndex = 0

    var body: some View {
        VStack (alignment: .leading, content:{
            CloseButton(action: {
                presentationMode.wrappedValue.dismiss()
            })
            Text("Create new task").font(FontStyles.largeTitle)
    
            TextField("Describe your task", text: $newTitle)
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .frame(maxWidth: .infinity)
            ComplexitySlider(selectedIndex: $selectedIndex)
            
            Text("Lets break your task down to \(viewModel.getNumberOfTasksBySelectedIndex(selectedIndex)) steps")
            
            if let error = errorMessage {
                       Text(error)
                           .font(.caption)
                           .foregroundColor(.red)
                           .padding(.vertical, 8)
                   }
            Button(action: {
                if(!newTitle.isEmpty) {
                    viewModel.addTask(newTitle, numberOfTask: String(selectedIndex))
                    newTitle = ""
                    presentationMode.wrappedValue.dismiss()
                } else {
                    errorMessage = "Please describe your message."
                }
            }) {
                Text("Break down task 🔥")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            }
            Spacer()
        }).padding()
    }
}

#Preview {
    AddTaskView().environmentObject(mockViewModel)
}

