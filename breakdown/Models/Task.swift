//
//  Task.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

class Task: Identifiable {
    let id: UUID
    var title: String
    var description: String? // Nullable property
    var isDone: Bool = false // Default value for isDone
    var subTasks : [Task] = []
    
    // Initializer
    init(title: String, description: String? = nil, isDone: Bool = false, subTasks: [Task] = []) {
        self.id = UUID() // Automatically generate a new UUID
        self.title = title
        self.description = description
        self.isDone = isDone
        self.subTasks = subTasks
    }
    
    func getNumberOfSubTasksDone() -> Int {
        return subTasks.filter { $0.isDone }.count;
    }
    
    func getNumberOfSubTasks() -> Int {
        return subTasks.count;
    }
}
