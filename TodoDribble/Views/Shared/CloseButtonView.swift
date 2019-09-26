//
//  CloseButtonView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 25/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct CloseButtonView: View {
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .resizable()
            .frame(width: 24, height: 24)
            .background(Color.gray)
            .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
            .clipShape(Circle())
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView()
    }
}
