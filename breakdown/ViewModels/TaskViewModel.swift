//
//  TaskViewModel.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

class TaskViewModel : ObservableObject {
    @Published var tasks: [Task] = [Task(title: "Task 1"), Task(title: "task 2"),  Task(title: "task 3")]
    
    //LEARN is _ no named parameter or just position? how does it work when you have multiple
    func addTask(_ title: String) {
        let newTasks = Task(title: title)
        tasks.append(newTasks)
    }
    
    //LEARN is withID namedParameter?
    func toggleItem(withId id: UUID) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].isDone.toggle()
        }
    }
    
}
