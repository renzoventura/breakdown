//
//  TaskListHeaderView.swift
//  breakdown
//
//  Created by Renzo on 28/2/2025.
//

import SwiftUI

struct TaskListHeaderView: View {
    @EnvironmentObject private var viewModel : TaskViewModel
    var body: some View {
        HStack {
            Text("Hello User").font(FontStyles.subtitle)
            Spacer()
        }
        HStack {
            Text("Your Projects (\(viewModel.tasks.count))").font(FontStyles.largeTitle)
            Spacer()
        }    }
}

#Preview {
    TaskListHeaderView()
}
