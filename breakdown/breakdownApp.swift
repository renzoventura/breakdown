//
//  breakdownApp.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import SwiftUI

@main
struct breakdownApp: App {
    init() {
        // Set up the navigation bar appearance
//        let appearance = UINavigationBarAppearance()
//        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
//        appearance.backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.black]
//        
//        // Apply the appearance globally
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        UINavigationBar.appearance().tint = .black


    }
    var body: some Scene {
        WindowGroup {
            TaskListView().environmentObject(TaskViewModel()) //LEARN here we are creating taskViewMode to have one instance for VM to be accessed everywhere
        }
    }
}
