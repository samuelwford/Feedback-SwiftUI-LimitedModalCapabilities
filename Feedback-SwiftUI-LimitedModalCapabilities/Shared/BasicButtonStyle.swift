//
//  BasicButtonStyle.swift
//  Feedback-SwiftUI-LimitedModalCapabilities
//
//  Created by Samuel Ford on 6/10/21.
//

import SwiftUI

struct BasicButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8.0).foregroundColor(color))
    }
}
