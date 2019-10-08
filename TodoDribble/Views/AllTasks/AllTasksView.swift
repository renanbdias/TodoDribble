//
//  AllTasksView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 07/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct AllTasksView: View {
    
    @EnvironmentObject var app: App
    
    @Binding var todoLists: [TodoList]

    var body: some View {
        NavigationView {
            Group {
                
                if (todoLists.flatMap { $0.tasks }).isEmpty {
                    Text("You are all up to date! 🎉🎉🎉")
                } else {
                    List {
                        ForEach(todoLists.flatMap { $0.tasks }.asTasksByDate) { tasksByDate in
                            Section(header: Text("Date: \(tasksByDate.date.description)")) {
                                ForEach(tasksByDate.tasks) { task in
                                    TaskListCellView(task: task, showLineDivider: false)
                                        .environmentObject(self.app)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Tasks")
        }
    }
}

struct AllTasksView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AllTasksView(todoLists: .constant(TodoList.mock))
            AllTasksView(todoLists: .constant([]))
        }
    }
}
