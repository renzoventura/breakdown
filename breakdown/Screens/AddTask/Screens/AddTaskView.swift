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
    @EnvironmentObject private var viewModel : TaskViewModel

    var body: some View {
        VStack (alignment: .leading, content:{
            HStack {
                Text("New task").font(FontStyles.largeTitle)
                Spacer()
                CloseButton(action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
//            TextField("Describe your task", text: $viewModel.newTodoItem)
//                .padding(.horizontal, 16)
//                .padding(.vertical, 16)
//                .background(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
//                )
//                .frame(maxWidth: .infinity)
//
            Text("Describe your task below...")
                .font(FontStyles.caption)
                .padding(.bottom, 5)
            TextEditor(text:$viewModel.newTodoItem)
                .cornerRadius(10)
                .padding( 8)
                .frame(width: .infinity, height: 150) // Set fixed width and height
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .cornerRadius(10) // Rounded corners
                .font(FontStyles.body)
//                       .padding(.horizontal)
            ComplexitySlider()
            Text("Your task is \(viewModel.currSelectedSliderItem.title)")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .font(FontStyles.calloutBold)
                .padding(.bottom, 5)
            Text("So We'll break it down to \(String(viewModel.currSelectedSliderItem.numberOfItems)) steps")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .font(FontStyles.calloutBold)
            Spacer()
            if let error = viewModel.errorMessageAddTask {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.vertical, 8)
            }
            if viewModel.isLoading {
                HStack {
                    Spacer()
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            } else {
                Button(action: {
                    viewModel.addTask(completion: {
                        presentationMode.wrappedValue.dismiss()
                    })
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
            }
       
        }).padding()
    }
}

#Preview {
    AddTaskView().environmentObject(mockViewModel)
}

