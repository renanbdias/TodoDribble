//
//  CustomNavigationBarView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: "list.dash")
                .foregroundColor(.white)
            
            Spacer()
            
            Text("TODO")
                .foregroundColor(.white)
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
        }
        .padding()
        .background(color)
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomNavigationBarView(color: .flatOrange)
            CustomNavigationBarView(color: .flatBlue)
            CustomNavigationBarView(color: .flatGreen)
        }
        .previewLayout(.fixed(width: 414, height: 128))
        
    }
}
