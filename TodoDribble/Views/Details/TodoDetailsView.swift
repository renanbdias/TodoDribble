//
//  TodoDetailsView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct TodoDetailsView: View {
    
    @Environment(\.presentationMode) var isPresented
    @State var newTaskIsPresented = false
    
    @ObservedObject var todoList: TodoList
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {

            ScrollView {
                VStack {
                    HStack {
                        DetailsHeaderView(todoList: todoList)
                        Spacer()
                    }
                    if todoList.tasks.isEmpty {
                        Text("You are all up to date! 🎉")
                            .font(.headline)
                    } else {
                        TaskListView(taskList: $todoList.tasks)
                    }
                }
                .padding()
            }
            
            Button(action: {
                self.newTaskIsPresented.toggle()
            }) {
                FloatingButtonView(color: todoList.color)
            }
            .padding()
            
            CloseButtonView()
                .onTapGesture(perform: dismiss)
                .position(x: UIScreen.main.bounds.width - 24, y: 40)
        }
        .sheet(isPresented: $newTaskIsPresented, content: { NewTaskView(todoList: self.todoList) })
    }
    
    private func dismiss() {
        isPresented.wrappedValue.dismiss()
    }
}

struct TodoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailsView(todoList: TodoList.mock[0])
    }
}
