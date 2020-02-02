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
    
    init(name: String, avatarName: String) {
        self.name = name
        self.avatarName = avatarName
    }
}

extension User {
    
    convenience init(userDB: UserDB) {
        self.init(name: userDB.name, avatarName: userDB.avatarName)
    }
}

extension User {
    
    static let mock = User(name: "Renan", avatarName: "avatar0")
}
