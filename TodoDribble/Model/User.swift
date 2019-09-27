//
//  User.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 25/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation

final class User: ObservableObject {
    
    @Published var name: String
    @Published var avatarName: String
    @Published var todoLists: [TodoList]
    
    init(name: String, avatarName: String, todoLists: [TodoList]) {
        self.name = name
        self.avatarName = avatarName
        self.todoLists = todoLists
    }
}

extension User {
    
    static let mock = User(name: "Renan", avatarName: "avatar0", todoLists: TodoList.mock)
}
