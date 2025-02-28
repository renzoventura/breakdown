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
    
    func calculatePercentage() -> String {
        return  String(Int(calculateProgress() * 100))
    }
    
    func calculateProgress() -> Double {
        guard subTasks.count > 0 else {
            return 0.0
        }
        
        let total = Double(subTasks.count)
        let completed = Double(subTasks.filter { $0.isDone }.count)
        
        guard total > 0 else {
            return 0.0
        }
        
        return (completed / total)
    }
    
    func isAllTasksDone() -> Bool {
        let total = Double(subTasks.count)
        let completed = Double(subTasks.filter { $0.isDone }.count)
        return total == completed;
    }
    
    
}

 
