//
//  FullScreenCoverExample.swift
//  Feedback-SwiftUI-LimitedModalCapabilities
//
//  Created by Samuel Ford on 6/10/21.
//

import SwiftUI

struct FullScreenCoverExample: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("This method is *CLOSE*; it WILL cover the TabBar, but is limited to a slide-up presentation from the bottom & no background transparency.")
                .bold()
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
            Spacer()
            Button("Say Hello in a Full Screen Cover") {
                isPresented = true
            }
            .buttonStyle(BasicButtonStyle(color: .blue))
        }
        .padding()
        .fullScreenCover(isPresented: $isPresented) {
            MessageView(message: "Hello, in a Full Screen Cover")
                .onTapGesture {
                    isPresented = false
                }
        }
    }
}

struct FullScreenCoverExample_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverExample()
    }
}
