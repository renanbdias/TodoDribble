//
//  TasksByDate.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 07/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation

final class TasksByDate: Identifiable {
    
    let id: UUID
    let date: Date
    var tasks: [Task]
    
    init(id: UUID, date: Date, tasks: [Task]) {
        self.id = id
        self.date = date
        self.tasks = tasks
    }
}

extension TasksByDate {
    
    static let mock = [
        TasksByDate(id: UUID(), date: Date(), tasks: [Task.mock[0], Task.mock[1]]),
        TasksByDate(id: UUID(), date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, tasks: [Task.mock[2], Task.mock[3]])
    ]
}
