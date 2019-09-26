//
//  ProgressBarView.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 20/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

struct ProgressBarView: View {
    
    @Binding var progress: CGFloat
    
    var body: some View {
        // MARK: - 🤔🤔🤔
//        GeometryReader { reader in
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(height: 4)
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 375.0 * (self.progress / 100.0), height: 4)
//                .frame(width: reader.size.width * (self.progress / 100.0), height: 4)
        }
        .cornerRadius(4)
//        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBarView(progress: .constant(25.0))
            ProgressBarView(progress: .constant(50.0))
            ProgressBarView(progress: .constant(75.0))
            ProgressBarView(progress: .constant(100.0))
        }
        .previewLayout(.fixed(width: 414, height: 128))
    }
}
