//
//  Repository.swift
//  breakdown
//
//  Created by Renzo on 19/2/2025.
//

import Foundation

class TaskRepository {
    
    var geminiKey: String = ""

    func fetchSubTasks(for task: String, taskNumber: String, completion: @escaping ([Task]?) -> Void) {
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            geminiKey = apiKey
        }
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=\(geminiKey)") else {
            completion(nil)
            return
        }
        
        
        let prompt : String = "Please break down the task \"\(task)\" into \(taskNumber) simple, actionable to-do items. Return the result as a JSON array of strings, where each string represents a to-do item."

        let requestBody: [String: Any] = [
            "contents": [
                ["parts": [["text": prompt]]]
            ],
            "generationConfig": ["response_mime_type": "application/json"]
        ]

        guard let httpBody = try? JSONSerialization.data(withJSONObject: requestBody) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let content = candidates.first?["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String,
                   let toDoItems = try? JSONDecoder().decode([String].self, from: Data(text.utf8)) {

                    let subTasks = toDoItems.map { Task(title: $0) }
                    completion(subTasks)
                } else {
                    print("Invalid JSON structure")
                    completion(nil)
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    func extractStrings(from jsonString: String) -> [String] {
        // Convert the JSON string to Data
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Invalid JSON string")
        }

        do {
            // Parse the JSON data
            if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: [String]]],
               let stringList = jsonArray.first?["text"] {
                return stringList
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }

        return []
    }

}
