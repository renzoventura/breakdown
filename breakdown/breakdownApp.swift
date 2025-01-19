//
//  breakdownApp.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import SwiftUI

@main
struct breakdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TaskViewModel()) //LEARN here we are creating taskViewMode to have one instance for VM to be accessed everywhere
        }
    }
}
