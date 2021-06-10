//
//  PresentAsModalTest.swift
//  SwiftUIPresentAsModal
//
//  Created by Samuel Ford on 6/9/21.
//

import SwiftUI

struct PresentAsModalTest: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Group {
                Text("This is the desired result.")
                    .bold()
                    .font(.title)
                    .padding(.bottom, 20)
                Text("The view is presented over the entire screen with a semi-transparent background.\n\nUnfortunatley, this requires reaching down into UIKit to present a SwiftUI view using UIKit's modal presentation style.")
                    .bold()
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 15)
            .foregroundColor(.green)
            .multilineTextAlignment(.center)
            Spacer()
            Button("Say Hello with a UIKit Modal") {
                isPresented.toggle()
            }
        }
        .padding()
        // WORKAROUND: custom view extension that presents a view
        //             inside a UIHostingViewController that is
        //             presented modally from the rootViewController.
        .modal(isPresented: $isPresented) {
            MessageView(message: "Hello, UIKit Modally")
        }
    }
}

struct PresentAsModalTest_Previews: PreviewProvider {
    static var previews: some View {
        PresentAsModalTest()
    }
}
