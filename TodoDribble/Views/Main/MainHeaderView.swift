//
//  MainHeaderView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct MainHeaderView: View {
    
    let userName: String
    let numberOfTasks: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 42, height: 42)
                .clipShape(Circle())
                .shadow(radius: 5, x: 2, y: 4)
                .padding(.bottom, 8)
            
            Text("Hello, \(userName).")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text("Looks like feel good.")
                .font(.subheadline)
                .foregroundColor(Color.white.opacity(0.8))
            
            Text("You have \(numberOfTasks) to do today.")
                .font(.subheadline)
                .foregroundColor(Color.white.opacity(0.8))
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView(userName: "Renan", numberOfTasks: 3)
            .background(Color.flatOrange)
            .previewLayout(.fixed(width: 414, height: 248))
    }
}
