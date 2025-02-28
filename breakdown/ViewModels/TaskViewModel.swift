//
//  TaskViewModel.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

class TaskViewModel : ObservableObject {
    @Published var tasks: [Task] = multipleMocks
    @Published var currSelectedSliderItem : ComplexitySliderItem = listOfComplexityItems.first!;
    @Published var errorMessageAddTask : String?
    @Published var isLoading : Bool = false;
    @Published var newTodoItem : String = ""

    private let taskRepository = TaskRepository()
    
    func resetSliderItem() {
        currSelectedSliderItem = listOfComplexityItems.first!;
    }
    
    func addTask(completion: @escaping () -> Void) {
        let numberToBreakDown = currSelectedSliderItem.numberOfItems
        if (!newTodoItem.isEmpty) { 
            self.errorMessageAddTask = nil
            self.isLoading = true
            taskRepository.fetchSubTasks(for: newTodoItem, taskNumber: String(numberToBreakDown)) { [weak self] subTasks in
                DispatchQueue.main.async {
                    if(subTasks != nil && !(subTasks?.isEmpty ?? true)) {
                        let newTask = Task(title: self!.newTodoItem, subTasks: subTasks ?? [])
                        self?.tasks.append(newTask)
                        self!.newTodoItem = ""
                        completion()
                    } else {
                        self!.errorMessageAddTask = "Failed to create error message";
                    }
                    self!.isLoading = false
                }
                
            }
        } else {
            self.errorMessageAddTask = "Please enter your new todo";
        }
    
    }
    
    func toggleTask(withId id: UUID) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].isDone.toggle()
        }
    }
    
    func getTaskById(withId id: UUID) -> Task? {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            return tasks[index];
        } else {
            return nil;
        }
    }
    
    func toggleSubTask(withParentTaskId parentTaskId: UUID, withSubTaskId subTaskId: UUID) {
        if let parentTaskIndex = tasks.firstIndex(where: { $0.id == parentTaskId }) {
            let parentTask = tasks[parentTaskIndex]  // Create a mutable copy of the task cannot just use if var
            if let subTaskIndex = parentTask.subTasks.firstIndex(where: { $0.id == subTaskId }) {
                parentTask.subTasks[subTaskIndex].isDone.toggle()
                tasks[parentTaskIndex] = parentTask  // Update the tasks array
            }
        }
    }
    
}
