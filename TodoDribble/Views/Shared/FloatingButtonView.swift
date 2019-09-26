//
//  FloatingButtonView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 22/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct FloatingButtonView: View {
    
    let color: Color
    
    var body: some View {
        Text("+")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(Circle())
            .shadow(radius: 5, x: 2, y: 4)
    }
}

struct FloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButtonView(color: .flatBlue)
    }
}
