//
//  App.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 25/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation
import RealmSwift

final class App: ObservableObject {
    
    @Published var user: User
    
    let firstTime: Bool
    
    private var userDB: UserDB? {
        try? Realm().objects(UserDB.self).first
    }
    
    private var realm: Realm? {
        try? Realm()
    }
    
    init(user: User) {
        self.user = user
        self.firstTime = true
    }
    
    init() {
        let realm = try! Realm()
            
        let userDB = realm.objects(UserDB.self).first
        
        if let userDB = userDB {
            self.user = User(userDB: userDB)
            self.firstTime = false
        } else {
            let newUser = User(name: "", avatarName: "avatar0", todoLists: initial)
            let newUserDB = UserDB()
            newUserDB.name = newUser.name
            newUserDB.avatarName = newUser.avatarName
            
            let todoListsDB: [TodoListDB] = newUser.todoLists.map {
                let todoListDB = TodoListDB()
                todoListDB.id = $0.id
                todoListDB.title = $0.title
                todoListDB.iconName = $0.iconName
                todoListDB.color = $0.color.name
                return todoListDB
            }
            
            newUserDB.todoLists.append(objectsIn: todoListsDB)
            
            try! realm.write {
                realm.add(newUserDB)
            }
            
            self.user = newUser
            self.firstTime = true
        }
    }
    
    func save(user: User) {
        guard let realm = self.realm,
            let userDB = self.userDB else { return }
        
        try! realm.write {
            userDB.name = user.name
            userDB.avatarName = user.avatarName
        }
    }
    
    func create(task: Task, on todoList: TodoList) {
        guard let realm = self.realm,
            let userDB = self.userDB else { return }
        
        guard let todoListDB = userDB.todoLists.first(where: { $0.id == todoList.id }) else { return }
        
        let taskDB = TaskDB()
        taskDB.id = task.id
        taskDB.text = task.text
        taskDB.done = task.done
        
        try! realm.write {
            todoListDB.tasks.append(taskDB)
        }
    }
    
    func mark(task: Task, doneAs done: Bool) {
        guard let realm = self.realm,
            let taskDB = realm.object(ofType: TaskDB.self, forPrimaryKey: task.id) else { return }
        
        try! realm.write {
            taskDB.done = done
        }
    }
    
    func delete(task: Task) {
        guard let realm = self.realm,
            let taskDB = realm.object(ofType: TaskDB.self, forPrimaryKey: task.id) else { return }
        
        try! realm.write {
            realm.delete(taskDB)
        }
        
        let todoList = user.todoLists.first(where: { list in list.tasks.contains(where: { $0.id == task.id }) })
        todoList?.tasks.removeAll(where: { $0.id == task.id })
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
