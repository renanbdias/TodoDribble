//
//  NewTaskView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 22/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
    
    let todoList: TodoList
    
    @Environment(\.presentationMode) var isPresented
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Group {
                    Text("What tasks are you planning to perform?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    TextField("Type here", text: $text)
                        .frame(height: 50)
                }
                .padding()
                
                Group {
                    NewTaskDetailsType(image: todoList.icon, title: todoList.title)
                    NewTaskDetailsType(image: Image(systemName: "calendar"), title: "Today")
                }
                .padding(.leading)
                .padding(.bottom)
                
                Spacer()
            }
            .padding(.leading)
            .navigationBarTitle("New Task", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: self.save) {
                    Text("Save")
                }
                .foregroundColor(self.todoList.color)
            )
        }
    }
    
    private func save() {
        if !text.isEmpty {
            todoList.tasks.append(Task(id: UUID().hashValue, text: text, done: false, date: Date()))
        }
        isPresented.wrappedValue.dismiss()
    }
}

struct NewTaskDetailsType: View {
    
    let image: Image
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Group {
                    image
                    Text(title)
                        .font(.subheadline)
                }
                .foregroundColor(.gray)
            }
            Rectangle()
                .frame(height: 0.4)
                .foregroundColor(.gray)
                .padding(.leading, 25)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(todoList: TodoList.mock[0])
    }
}
