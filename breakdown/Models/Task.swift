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
    var description: String?
    var isDone: Bool = false
    var subTasks : [Task] = []
    var dateCreated: Date
    
    init(title: String, description: String? = nil, isDone: Bool = false, subTasks: [Task] = []) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.isDone = isDone
        self.subTasks = subTasks
        self.dateCreated = Date()
    }
    
    func getNumberOfSubTasksDone() -> Int {
        return subTasks.filter { $0.isDone }.count;
    }
    
    func getNumberOfSubTasks() -> Int {
        return subTasks.count;
    }
    
    func getProgressOfSubTasks() -> String {
        return "\(getNumberOfSubTasksDone()) / \(getNumberOfSubTasks())";
    }
    
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        //formatter.timeStyle = .none
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: dateCreated)
    }
}

