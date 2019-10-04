//
//  NavigationBarBuilder.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 03/10/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct NavigationBarBuilder<Content: View>: View {
    
    private let alignment: HorizontalAlignment
    private let content: Content
    private var color: Color
    
    public init(alignment: HorizontalAlignment, color: Color, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.color = color
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: alignment) {
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
            
            content
        }
    }
}

struct NavigationBarBuilder_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBarBuilder(alignment: .leading, color: .flatOrange) {
                EmptyView()
            }
            
            NavigationBarBuilder(alignment: .leading, color: .flatBlue) {
                EmptyView()
            }
            
            NavigationBarBuilder(alignment: .leading, color: .flatGreen) {
                EmptyView()
            }
        }
        .previewLayout(.fixed(width: 414, height: 128))
    }
}
