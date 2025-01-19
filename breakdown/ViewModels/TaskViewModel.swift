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
        print("ITEMS")
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            print("UPDATE!")
            tasks[index].isDone.toggle()
        } else {
            print("NO UPDATE")
        }
    }
    
    
    //Create a function that returns the TASK by id and return it as a binding item so that both screens can listen to such item
    
}
