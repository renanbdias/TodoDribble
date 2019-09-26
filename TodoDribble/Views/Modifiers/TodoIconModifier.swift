//
//  TodoIconModifier.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct TodoIconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42)
            .clipShape(Circle())
            .padding(1)
            .overlay(Circle().stroke(Color.gray, lineWidth: 0.1))
    }
}
