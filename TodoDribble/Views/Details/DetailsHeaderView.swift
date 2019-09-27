//
//  DetailsHeaderView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct DetailsHeaderView: View {
    
    @ObservedObject var todoList: TodoList
    
    @State var progress: CGFloat = 83
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: todoList.iconName)
                .modifier(TodoIconModifier())
                .foregroundColor(todoList.color)
                .padding(.bottom)
            
            Text("\(todoList.tasks.count) Tasks")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(todoList.title)
                .font(.largeTitle)
            
            HStack {
                ProgressBarView(progress: $progress)
                Text(String(format: "%.0f%%", Double(progress)))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsHeaderView(todoList: TodoList.mock[0])
            .previewLayout(.sizeThatFits)
    }
}
