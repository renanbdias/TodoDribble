//
//  MainCardView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 19/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct MainCardView: View {
    
    @State var progress: CGFloat = 0.0
    
    var todoList: TodoList
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: todoList.iconName)
                    .modifier(TodoIconModifier())
                    .foregroundColor(todoList.color)
                
                Spacer()
                
                Text("TODO")
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Text("\(todoList.tasks.count) Tasks")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(todoList.title)
                .foregroundColor(.black)
                .font(.largeTitle)
            
            HStack {
                ProgressBarView(progress: $progress)
                Text("\(todoList.totalDone)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(height: 10)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainCardView(todoList: TodoList.mock[0])
            MainCardView(todoList: TodoList.mock[0]).colorScheme(.dark)
        }
        .previewLayout(.fixed(width: 278, height: 360))
    }
}
