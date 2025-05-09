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
    
    // Add this focus state property
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        VStack (alignment: .leading, content:{
            HStack {
                Text("New task").font(FontStyles.largeTitle)
                Spacer()
                CloseButton(action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
            Text("Describe your task below...")
                .font(FontStyles.caption)
                .padding(.bottom, 5)
            ZStack(alignment: .topLeading) {
                TextEditor(text:$viewModel.newTodoItem)
                    .cornerRadius(10)
                    .padding( 8)
                    .frame( height: 120)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                    )
                    .cornerRadius(10)
                    .font(FontStyles.body)
                    .focused($isTextFieldFocused)
                if viewModel.newTodoItem.isEmpty {
                    HintText()
                }
            }

            ComplexitySlider()
            HStack {
                Text("Your task is ")
                    .font(FontStyles.callout)
                + Text("\(viewModel.currSelectedSliderItem.title)")
                    .font(FontStyles.calloutBold)
            }         .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 2)
            HStack {
                Text("So we'll break it down to ")
                    .font(FontStyles.callout)
                + Text("\(String(viewModel.currSelectedSliderItem.numberOfItems))")
                    .font(FontStyles.calloutBold)
                + Text(" steps")
                    .font(FontStyles.callout)
            }         .frame(maxWidth: .infinity, alignment: .center)
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
                    Text("Break down 🔥")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(25)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                } 
            }
       
        }).padding()
            .onAppear {
                // Small delay to ensure the view is fully loaded before focusing
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    isTextFieldFocused = true
                }
            }
    }
}

#Preview {
    AddTaskView().environmentObject(mockViewModel)
}


struct HintText: View {
    var body: some View {
        Text(listOfExamples.randomElement()!)
            .font(FontStyles.body)
            .foregroundColor(.gray)
            .padding(.top, 15)
            .padding(.leading, 11)
            .padding(.trailing, 8)
            .allowsHitTesting(false)
    }
}
