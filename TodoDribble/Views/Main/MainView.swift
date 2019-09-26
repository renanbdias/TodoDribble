//
//  MainView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

extension Date {
    
    var homeFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        return formatter.string(from: self)
    }
}

struct MainView: View {
    
    @EnvironmentObject var app: App
    
    @State var detailsIsPresented = false
    @State var detailsIndex: Int = 0
    
    var homeDate = "Today : \(Date().homeFormatted)"
    
    private var currentSelectedBackgroundColor: Color {
        return app.user.todoLists[detailsIndex].color
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomNavigationBarView(color: app.user.todoLists[detailsIndex].color)
                .animation(.easeInOut)
            
            MainHeaderView(userName: "Renan", numberOfTasks: 3)
                .padding(.leading, 52)
                .padding(.top, 32)
            
            Spacer()

            Text(homeDate)
                .foregroundColor(Color.white.opacity(0.8))
                .padding(.leading, 52)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(0..<app.user.todoLists.count) { index in
                        Button(action: { self.showDetails(index: index) }) {
                            MainCardView(todoList: self.app.user.todoLists[index])
                                .frame(width: 278, height: 360)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    // 😢😢😢
//                    ForEach(todoLists) { list in
//                        Button(action: {
//                            self.detailsUUID = list.id
//                            self.detailsIsPresented.toggle()
//                        }) {
//                            MainCardView(todoList: list)
//                                .frame(width: 278, height: 360)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
                    
                }
                .padding(.horizontal, 52)
            }
            
            Spacer()
        }
        .sheet(isPresented: $detailsIsPresented, content: { TodoDetailsView(todoList: self.app.user.todoLists[self.detailsIndex]) })
        .background(currentSelectedBackgroundColor.edgesIgnoringSafeArea(.all))
        .animation(.easeInOut)
    }
    
    private func showDetails(index: Int) {
        detailsIndex = index
        detailsIsPresented.toggle()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(User.mock)
    }
}
