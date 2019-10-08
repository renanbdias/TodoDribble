//
//  SelectUserAvaterView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 26/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct SelectUserAvaterView: View {
    
    @Binding var userAvatarName: String
    
    let firstRow = ["avatar0", "avatar1", "avatar2", "avatar3", "avatar4"]
    let secondRow = ["avatar5", "avatar6", "avatar7", "avatar8", "avatar9"]
    
    var body: some View {
        VStack {
            Text("Select your avatar")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            VStack {
                HStack(spacing: 20) {
                    ForEach(firstRow, id: \.self) { avatarName in
                        UserAvatarView(avatarName: avatarName)
                            .overlay(Circle().stroke(Color.white, lineWidth: avatarName == self.userAvatarName ? 2 : 0))
                            .onTapGesture(perform: { self.didSelect(avatarName: avatarName) })
                    }
                }
                .padding(.bottom)
                
                HStack(spacing: 20) {
                    ForEach(secondRow, id: \.self) { avatarName in
                        UserAvatarView(avatarName: avatarName)
                            .overlay(Circle().stroke(Color.white, lineWidth: avatarName == self.userAvatarName ? 2 : 0))
                            .onTapGesture(perform: { self.didSelect(avatarName: avatarName) })
                    }
                }
            }
        }
    }
    
    private func didSelect(avatarName: String) {
        userAvatarName = avatarName
    }
}

struct SelectUserAvaterView_Previews: PreviewProvider {
    static var previews: some View {
        SelectUserAvaterView(userAvatarName: .constant("avatar0"))
            .background(Color.flatBlue)
            .previewLayout(.sizeThatFits)
    }
}
