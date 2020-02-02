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
    @Published var todoLists: [TodoList]
    
    let firstTime: Bool
    
    init(user: User, todoLists: [TodoList]) {
        self.user = user
        self.todoLists = todoLists
        self.firstTime = true
    }
    
    init() {
        let realm = try! Realm()
            
        let userDB = realm.objects(UserDB.self).first
        
        if let userDB = userDB {
            self.user = User(userDB: userDB)
            self.todoLists = realm.objects(TodoListDB.self).map(TodoList.init(todoListDB:))
            self.firstTime = false
        } else {
            let newUser = User(name: "", avatarName: "avatar0")
            let newUserDB = UserDB()
            newUserDB.name = newUser.name
            newUserDB.avatarName = newUser.avatarName
            
            let todoListsDB: [TodoListDB] = TodoList.seed.map {
                let todoListDB = TodoListDB()
                todoListDB.id = $0.id
                todoListDB.title = $0.title
                todoListDB.iconName = $0.iconName
                todoListDB.color = $0.color.name
                return todoListDB
            }
            
//            newUserDB.todoLists.append(objectsIn: todoListsDB)
            
            try! realm.write {
                todoListsDB.forEach { realm.add($0) }
//                realm.add(newUserDB)
            }
            
            self.user = newUser
            self.todoLists = TodoList.seed
            self.firstTime = true
        }
    }
}

extension App {
    
    private var userDB: UserDB? {
        try? Realm().objects(UserDB.self).first
    }
    
    private var realm: Realm? {
        try? Realm()
    }
}

// MARK: - Actions
extension App {
    
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
