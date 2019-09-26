//
//  Task.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation

final class Task: ObservableObject, Identifiable {
    
    let id: UUID
    
    @Published var text: String
    @Published var done: Bool
    
    var date: Date
    
    init(id: UUID, text: String, done: Bool, date: Date) {
        self.id = id
        self.text = text
        self.done = done
        self.date = date
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

#if DEBUG
extension Task {
    static let mock = [
        Task(id: UUID(), text: "First Task", done: false, date: Date()),
        Task(id: UUID(), text: "Second Task", done: true, date: Date()),
        Task(id: UUID(), text: "Third Task", done: false, date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
        Task(id: UUID(), text: "Third Task", done: true, date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
    ]
}
#endif
