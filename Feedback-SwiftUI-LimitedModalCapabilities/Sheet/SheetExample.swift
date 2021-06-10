//
//  SheetExample.swift
//  Feedback-SwiftUI-LimitedModalCapabilities
//
//  Created by Samuel Ford on 6/10/21.
//

import SwiftUI

struct SheetExample: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("This method WILL cover the TabBar, but is limited to a sheet-style presentation from the bottom & no background transparency.")
                .bold()
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
            Spacer()
            Button("Say Hello with an Sheet") {
                isPresented = true
            }
            .buttonStyle(BasicButtonStyle(color: .blue))
        }
        .padding()
        .sheet(isPresented: $isPresented) {
            MessageView(message: "Hello, in a Sheet")
                .onTapGesture {
                    isPresented = false
                }
        }
    }
}

struct SheetExample_Previews: PreviewProvider {
    static var previews: some View {
        SheetExample()
    }
}
