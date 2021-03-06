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
    
    @State var editViewIsPresented = false
    @State var detailsIsPresented = false
    
    @State var detailsIndex: Int = 0
    
    @State var allTasksIsPresented = false
    @State var searchIsPresented = false
    
    private let homeDate = "Today : \(Date().homeFormatted)"
    
    private var currentSelectedBackgroundColor: Color {
        app.user.todoLists[detailsIndex].color
    }
    
    private var todoLists: [TodoList] {
        app.user.todoLists
    }
    
    var body: some View {
        NavigationBarBuilder(alignment: .leading, rightButtonAction: { self.searchIsPresented.toggle() }, leftButtonAction: { self.allTasksIsPresented.toggle() }) {
            MainHeaderView(user: $app.user)
                .padding(.leading, 52)
                .padding(.top, 32)
                .onTapGesture(perform: didTapHeaderView)
                .sheet(isPresented: $editViewIsPresented, content: { EditUserView(user: self.$app.user, newUser: true).environmentObject(self.app) })
            
            Spacer()

            Text(homeDate)
                .foregroundColor(Color.white.opacity(0.8))
                .padding(.leading, 52)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    ForEach(0..<todoLists.count) { index in
                        Button(action: { self.showDetails(index: index) }) {
                            MainCardView(todoList: self.todoLists[index])
                                .frame(width: 278, height: 360)
                        }
                        .sheet(isPresented: self.$detailsIsPresented, content: { TodoDetailsView(todoList: self.todoLists[self.detailsIndex]).environmentObject(self.app) })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 52)
            }
//            .sheet(isPresented: $allTasksIsPresented, content: {
//                AllTasksView(todoLists: self.$app.user.todoLists)
//                    .environmentObject(self.app)
//            })
            
            Spacer()
        }
        .onAppear(perform: onAppear)
        .background(currentSelectedBackgroundColor.edgesIgnoringSafeArea(.all))
        .animation(.easeInOut)
    }
    
    private func onAppear() {
        if app.firstTime {
            editViewIsPresented.toggle()
        }
    }
    
    private func didTapHeaderView() {
        editViewIsPresented.toggle()
    }
    
    private func showDetails(index: Int) {
        detailsIndex = index
        detailsIsPresented.toggle()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView().environmentObject(App.mock)
            
            MainView().environmentObject(App.mock)
                .colorScheme(.dark)
        }
    }
}
