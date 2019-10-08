//
//  TaskListCellView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct TaskListCellView: View {
    
    @EnvironmentObject var app: App
    
    @ObservedObject var task: Task
    
    var showLineDivider = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: task.done ? "checkmark.square.fill" : "square")
                    .foregroundColor(.gray)
                    .onTapGesture(perform: toggleTaskDone)
                
                Text(task.text)
                
                Spacer()
                
                if task.done {
                    Image(systemName: "trash")
                        .animation(.easeInOut)
                        .onTapGesture(perform: delete)
                }
            }
            
            if showLineDivider {
                Rectangle()
                    .frame(height: 0.4)
                    .foregroundColor(.gray)
                    .padding(.leading, 25)
            }
        }
    }
    
    private func toggleTaskDone() {
        app.mark(task: task, doneAs: !task.done)
        task.done.toggle()
        // MAKR: - Perhaps we should be doing this kinda of thing on App... If we do it there we can do something like App { todoList.tasks.delete(where { $0.id == task.id }) } or something like App { task.done.toggle() }
        // MARK: - Actions should not be handled on the view, only on it's ViewModel.
    }
    
    private func delete() {
        app.delete(task: task)
    }
}

struct TaskListCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskListCellView(task: Task.mock[0])
            TaskListCellView(task: Task.mock[1])
        }
        .previewLayout(.fixed(width: 414, height: 128))
    }
}
