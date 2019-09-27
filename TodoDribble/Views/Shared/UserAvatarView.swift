//
//  UserAvatarView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 26/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct UserAvatarView: View {
    
    let avatarName: String
    
    var body: some View {
        Image(avatarName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 42, height: 42)
            .clipShape(Circle())
            .shadow(radius: 5, x: 2, y: 4)
    }
}

struct UserAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        UserAvatarView(avatarName: "avatar0")
    }
}
