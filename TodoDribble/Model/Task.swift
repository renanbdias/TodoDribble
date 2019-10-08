//
//  Task.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation

final class Task: ObservableObject, Identifiable {
    
    let id: Int
    
    @Published var text: String
    @Published var done: Bool
    
    var date: Date
    
    init(id: Int, text: String, done: Bool, date: Date) {
        self.id = id
        self.text = text
        self.done = done
        self.date = date
    }
}

extension Task {
    
    convenience init(taskDB: TaskDB) {
        self.init(id: taskDB.id, text: taskDB.text, done: taskDB.done, date: taskDB.date)
    }
}

extension Array where Element == Task {
    
    var laterDates: [Task] {
        filter {
            let dateCompare = $0.date.compare(Date())
            switch dateCompare {
            case .orderedSame, .orderedAscending:
                return false
            default:
                return true
            }
        }
    }
    
    var todatAndPreviousDates: [Task] {
        let currentLaterDates = laterDates
        return filter { element in
            !currentLaterDates.contains(where: { element.id == $0.id })
        }
    }
}

extension Array where Element == Task {
    
    var asTasksByDate: [TasksByDate] {
        var allTasks: [TasksByDate] = []
        for task in self {
            if let tasksByDate = allTasks.first(where: { Calendar.current.compare($0.date, to: task.date, toGranularity: .day) == .orderedSame }) {
                tasksByDate.tasks.append(task)
            } else {
                let tasksByDate = TasksByDate(id: UUID(), date: task.date, tasks: [task])
                allTasks.append(tasksByDate)
            }
        }
        
        return allTasks
    }
}

extension Task {
    
    static let mock = [
        Task(id: 0, text: "First Task", done: false, date: Date()),
        Task(id: 1, text: "Second Task", done: true, date: Date()),
        Task(id: 2, text: "Third Task", done: false, date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
        Task(id: 3, text: "Third Task", done: true, date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
    ]
}
