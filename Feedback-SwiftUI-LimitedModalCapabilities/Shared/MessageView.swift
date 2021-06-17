//
//  MessageView.swift
//  SwiftUIPresentAsModal
//
//  Created by Samuel Ford on 6/9/21.
//

import SwiftUI

struct MessageView: View {
    let message: String
    
    @Environment(\.dismissModal) var dismiss
    
    var body: some View {
        Color.gray
            .opacity(0.8)
            .ignoresSafeArea()
            .overlay(
                Text(message)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8.0).foregroundColor(.orange))
                    .onTapGesture(perform: dismiss)
            )
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "Message")
    }
}
