//
//  UserDB.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 07/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import RealmSwift

final class UserDB: RealmBaseObject {
    
    @objc dynamic var name = ""
    @objc dynamic var avatarName = ""
}
