//
//  TodoListDB.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 07/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RealmSwift

final class TodoListDB: RealmBaseObject {
    
    @objc dynamic var title = ""
    @objc dynamic var color = ""
    @objc dynamic var iconName = ""
    
    let tasks = List<TaskDB>()
}
