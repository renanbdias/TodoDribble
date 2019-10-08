//
//  TaskDB.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 04/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskDB: RealmBaseObject {
    
    @objc dynamic var text = ""
    @objc dynamic var done = false
    @objc dynamic var date = Date()
    
    let todoList = LinkingObjects(fromType: TodoListDB.self, property: "tasks")
}

