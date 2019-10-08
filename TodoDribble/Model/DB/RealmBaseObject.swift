//
//  RealmBaseObject.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 07/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RealmSwift

class RealmBaseObject: Object {
    
    @objc dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
