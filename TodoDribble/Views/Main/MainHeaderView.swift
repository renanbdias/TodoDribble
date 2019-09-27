//
//  MainHeaderView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct MainHeaderView: View {
    
    @ObservedObject var user: User
    
    // MARK: - Must have this because it won't trigger from a user instance. Weird...
    @Binding var todoLists: [TodoList]
    
    private var generalMessage: String {
        let remainingTasksCount = todoLists.map { $0.tasks.filter { !$0.done }.count }.reduce(0, +)
        if remainingTasksCount <= 4 {
            return "Looks like feel good."
        } else if remainingTasksCount <= 10 {
            return "Things are crowding up!"
        } else {
            return "Get your stuff together!"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            UserAvatarView(avatarName: user.avatarName)
                .padding(.bottom, 8)
            
            Text("Hello, \(user.name).")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(generalMessage)
                .font(.subheadline)
                .foregroundColor(Color.white.opacity(0.8))
            
            Text("You have \(todoLists.map { $0.tasks.filter { !$0.done }.count }.reduce(0, +)) tasks to do today.")
                .font(.subheadline)
                .foregroundColor(Color.white.opacity(0.8))
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView(user: User.mock, todoLists: .constant(TodoList.mock))
            .background(Color.flatOrange)
            .previewLayout(.fixed(width: 414, height: 248))
    }
}
