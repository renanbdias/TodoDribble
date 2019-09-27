//
//  App.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 25/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation

final class App: ObservableObject {
    
    @Published var user: User
    @Published var firstTime: Bool = true
    
    init(user: User) {
        self.user = user
    }
}

extension App {
    
    static let mock = App(user: User(name: "Renan", avatarName: "avatar0", todoLists: initial))
}

let initial = [
    TodoList(id: 0, title: "Personal", color: .flatOrange, iconName: "person.fill", tasks: []),
    TodoList(id: 1, title: "Work", color: .flatBlue, iconName: "briefcase.fill", tasks: []),
    TodoList(id: 2, title: "Home", color: .flatGreen, iconName: "house.fill", tasks: [])
]
