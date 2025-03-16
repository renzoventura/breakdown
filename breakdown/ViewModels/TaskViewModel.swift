//
//  TaskViewModel.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

class TaskViewModel : ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    @Published var currSelectedSliderItem : ComplexitySliderItem = listOfComplexityItems[1];
    @Published var errorMessageAddTask : String?
    @Published var isLoading : Bool = false;
    @Published var newTodoItem : String = ""
    @Published var isCompletedFilter : Bool = false;

    @Published var currentSelectedTask : Task?
    
    private let taskRepository = TaskRepository()
    
    init() {
        loadTasks()
    }
    
    // Get the file path for documents directory
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // Save tasks to file
    private func saveTasks() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(tasks)
            try data.write(to: getDocumentsDirectory().appendingPathComponent("tasks.json"))
        } catch {
            print("Error saving tasks: \(error.localizedDescription)")
        }
    }
    
    // Load tasks from file
    private func loadTasks() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("tasks.json")
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            // If no file exists yet, initialize with mock data
            tasks = mockTasks
            return
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            tasks = try decoder.decode([Task].self, from: data)
        } catch {
            print("Error loading tasks: \(error.localizedDescription)")
            tasks = mockTasks
        }
    }
    
    func setCurrentSelectedTask (withSelectedTask selectedTask : Task) {
        currentSelectedTask = selectedTask
    }
    
    func resetSliderItem() {
        currSelectedSliderItem = listOfComplexityItems[1];
    }
    
    var filteredList: [Task] {
        isCompletedFilter ? completedTasks : incompleteTasks
    }
    
    // Getter for filtered tasks
     var incompleteTasks: [Task] {
         tasks.filter { !$0.isAllTasksDone() }
     }

     // Getter for completed tasks
     var completedTasks: [Task] {
         tasks.filter { $0.isAllTasksDone() }
     }
    
    func addTask(completion: @escaping () -> Void) {
        let numberToBreakDown = currSelectedSliderItem.numberOfItems
        if (!newTodoItem.isEmpty) {
            self.errorMessageAddTask = nil
            self.isLoading = true
            let taskName = newTodoItem.replacingOccurrences(of: "\n", with: " ")
            taskRepository.fetchSubTasks(for: taskName, taskNumber: String(numberToBreakDown)) { [weak self] subTasks in
                DispatchQueue.main.async {
                    if(subTasks != nil && !(subTasks?.isEmpty ?? true)) {
                        let newTask = Task(title: taskName, subTasks: subTasks ?? [])
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
            // No need to call saveTasks() explicitly, didSet will handle it
        }
    }
    
    func getTaskById(withId id: UUID) -> Task? {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            return tasks[index];
        } else {
            return nil;
        }
    }
    
    func toggleSubTask(withSubTaskId subTaskId: UUID) {
        let parentTaskId = currentSelectedTask!.id
        if let parentTaskIndex = tasks.firstIndex(where: { $0.id == parentTaskId }) {
            let parentTask = tasks[parentTaskIndex]  // Create a mutable copy of the task cannot just use if var
            if let subTaskIndex = parentTask.subTasks.firstIndex(where: { $0.id == subTaskId }) {
                parentTask.subTasks[subTaskIndex].isDone.toggle()
                tasks[parentTaskIndex] = parentTask  // Update the tasks array
                // No need to call saveTasks() explicitly, didSet will handle it
            }
        }
    }
}
