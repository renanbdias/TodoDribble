//
//  TodoList.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 20/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

final class TodoList: ObservableObject, Identifiable {
    
    let id: Int
    
    let title: String
    let color: Color
    let iconName: String
    
    @Published var tasks: [Task]

    init(id: Int, title: String, color: Color, iconName: String, tasks: [Task]) {
        self.id = id
        self.title = title
        self.color = color
        self.iconName = iconName
        self.tasks = tasks
    }
}

extension TodoList {
    
    convenience init(todoListDB: TodoListDB) {
        self.init(id: todoListDB.id, title: todoListDB.title, color: Color(todoListDB.color), iconName: todoListDB.iconName, tasks: todoListDB.tasks.compactMap(Task.init(taskDB:)))
    }
}

// MARK: - SwiftUI
extension TodoList {
    
    var icon: Image {
        return Image(systemName: iconName)
    }
}

extension TodoList {
    static let mock = [
        TodoList(id: 0, title: "Personal", color: .flatOrange, iconName: "person.fill", tasks: Task.mock),
        TodoList(id: 1, title: "Work", color: .flatBlue, iconName: "briefcase.fill", tasks: Task.mock),
        TodoList(id: 2, title: "Home", color: .flatGreen, iconName: "house.fill", tasks: Task.mock)
    ]
}
