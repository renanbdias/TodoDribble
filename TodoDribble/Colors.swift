//
//  Colors.swift
//  TodoDribble
//
//  Created by Renan Benatti Dias on 21/09/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import SwiftUI

extension Color {
    
    static let flatOrange = Color("flatOrange")
   
    static let flatBlue = Color("flatBlue")
    
    static let flatGreen = Color("flatGreen")
}

extension Color {
    
    // MARK: - Workarround to get the color's name.
    public var name: String {
        description.split(separator: " ")[1].replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "\"", with: "")
    }
}
