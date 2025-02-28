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
            Text("Your Projects (\(viewModel.filteredList.count))")                .font(FontStyles.headline)
            Spacer()
        }    }
}

#Preview {
    TaskListHeaderView()
}
