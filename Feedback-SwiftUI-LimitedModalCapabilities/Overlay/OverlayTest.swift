//
//  OverlayTest.swift
//  SwiftUIPresentAsModal
//
//  Created by Samuel Ford on 6/9/21.
//

import SwiftUI

struct OverlayTest: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("This method WILL NOT cover the TabBar")
                .bold()
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Say Hello with an Overlay Modal") {
                isPresented = true
            }
            .buttonStyle(BasicButtonStyle(color: .blue))
        }
        .padding()
        // HACK: without this, the "modal" view is skinny
        .frame(maxWidth: .infinity)
        .overlay(
            Group {
                if isPresented {
                    MessageView(message: "Hello, Overlay Modally")
                        .environment(\.dismissModal, { isPresented = false })
                } else {
                    EmptyView()
                }
            }
            .animation(.default, value: isPresented)
        )
    }
}

struct OverlayTest_Previews: PreviewProvider {
    static var previews: some View {
        OverlayTest()
    }
}
