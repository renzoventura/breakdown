//
//  Task.swift
//  breakdown
//
//  Created by Renzo on 16/1/2025.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    var title: String
    var description: String? // Nullable property
    var isDone: Bool = false // Default value for isDone
    
    // Initializer
    init(title: String, description: String? = nil, isDone: Bool = false) {
        self.id = UUID() // Automatically generate a new UUID
        self.title = title
        self.description = description
        self.isDone = isDone
    }
}
