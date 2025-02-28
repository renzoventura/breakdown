//
//  FilterButtonsView.swift
//  breakdown
//
//  Created by Renzo on 28/2/2025.
//

import SwiftUI

struct FilterButtonsView: View {
    @EnvironmentObject private var viewModel : TaskViewModel

    var body: some View {
        VStack {
            HStack {
                FilterButton(
                    toggled: !viewModel.isCompletedFilter, text: "In Progress", onTap: {
                        if (viewModel.isCompletedFilter) {
                            viewModel.isCompletedFilter.toggle()
                        }
                    }
                )
                FilterButton(
                    toggled: viewModel.isCompletedFilter, text: "Done", onTap: {
                        if(!viewModel.isCompletedFilter) {
                            viewModel.isCompletedFilter.toggle()
                        }
                    }
                )
                Spacer()
            }
        }
    }
}

#Preview {
    FilterButtonsView()
}
