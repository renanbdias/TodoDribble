//
//  TaskListView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var app: App
    
    @Binding var taskList: [Task]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Today")
                .font(.subheadline)
                .foregroundColor(.gray)

            ForEach(taskList.todatAndPreviousDates) { task in
                TaskListCellView(task: task)
                    .contextMenu {
                        Button(action: { self.delete(task: task) }) {
                            VStack {
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }
                    }
            }

            Text("Tomorrow / Later")
                .font(.subheadline)
                .foregroundColor(.gray)

            ForEach(taskList.laterDates) { task in
                TaskListCellView(task: task)
                    .contextMenu {
                        Button(action: { self.delete(task: task) }) {
                            VStack {
                                Image(systemName: "trash")
                                Text("Delete")
                            }
                        }
                    }
            }
        }
    }
    
    private func delete(task: Task) {
        app.delete(task: task)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskList: .constant(Task.mock))
            .previewLayout(.sizeThatFits)
    }
}
