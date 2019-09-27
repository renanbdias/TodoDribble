//
//  MainCardProgressView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 26/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct MainCardProgressView: View {
    
    @State var progress: CGFloat = 0
    
    @ObservedObject var todoList: TodoList
    
    private var totalPrecentageDone: Int {
        guard todoList.tasks.count > 0 else { return 100 }
        let donePercentage = (todoList.tasks.filter { !$0.done }.count * 100) / todoList.tasks.count
        return 100 - donePercentage
    }
    
    var body: some View {
        HStack {
            ProgressBarView(progress: $progress)
            Text("\(totalPrecentageDone)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(height: 10)
    }
}

struct MainCardProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardProgressView(todoList: TodoList.mock[0])
    }
}
