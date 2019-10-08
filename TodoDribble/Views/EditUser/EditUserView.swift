//
//  EditUserView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 26/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct EditUserView: View {
    
    @Environment(\.presentationMode) var isPresented
    
    @EnvironmentObject var app: App
    
    @Binding var user: User
    
    var newUser: Bool
    
    let color = Color(red: 84/255, green: 164/255, blue: 196/255)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 40) {
                
                SelectUserAvaterView(userAvatarName: $user.avatarName)
                
                Text("Tell us your first name")
                    .font(.headline)
                    .foregroundColor(.white)
                
                TextField("Type here", text: $user.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .navigationBarTitle(newUser ? "New User" : "Edit User", displayMode: .inline)
            .padding()
            .background(color)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(trailing:
                Button(action: { self.isPresented.wrappedValue.dismiss() }) {
                    Text("Save")
                }
                .foregroundColor(self.color)
            )
        }
        .onDisappear(perform: onDisappear)
    }
    
    private func didSelect(avatarName: String) {
        user.avatarName = avatarName
    }
    
    private func onDisappear() {
        app.save(user: user)
    }
}

struct EditUserView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserView(user: .constant(User.mock), newUser: true)
    }
}
