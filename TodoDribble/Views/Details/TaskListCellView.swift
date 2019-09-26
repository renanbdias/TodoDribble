//
//  TaskListCellView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct TaskListCellView: View {
    
    @ObservedObject var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: task.done ? "checkmark.square.fill" : "square")
                    .foregroundColor(.gray)
                    .onTapGesture { self.task.done.toggle() }
                
                Text(task.text)
                
                Spacer()
                
                if task.done {
                    Image(systemName: "trash")
                        .animation(.easeInOut)
                        .onTapGesture { /* self.store.delete(taskId: task.id) */ }
                }
            }
            Rectangle()
                .frame(height: 0.4)
                .foregroundColor(.gray)
                .padding(.leading, 25)
        }
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
