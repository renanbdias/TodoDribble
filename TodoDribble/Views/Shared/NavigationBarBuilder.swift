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
    
    private let rightButtonAction: (() -> Void)?
    private let leftButtonAction: (() -> Void)?
    
    public init(
        alignment: HorizontalAlignment,
        rightButtonAction: (() -> Void)? = nil,
        leftButtonAction: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content) {
        
        self.alignment = alignment
        self.rightButtonAction = rightButtonAction
        self.leftButtonAction = leftButtonAction
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: alignment) {
            HStack {
                
                Button(action: leftButtonAction ?? { /* Do nothing */ }) {
                    Image(systemName: "list.dash")
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()

                Text("TODO")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()

                Spacer()

                Button(action: rightButtonAction ?? { /* Do nothing */ }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            
            content
        }
    }
}

struct NavigationBarBuilder_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBarBuilder(alignment: .leading) {
                EmptyView()
            }
            .background(Color.flatOrange)
            
            NavigationBarBuilder(alignment: .leading) {
                EmptyView()
            }
            .background(Color.flatBlue)
            
            NavigationBarBuilder(alignment: .leading) {
                EmptyView()
            }
            .background(Color.flatGreen)
        }
        .previewLayout(.fixed(width: 414, height: 128))
    }
}
