//
//  ContentView.swift
//  Feedback-SwiftUI-LimitedModalCapabilities
//
//  Created by Samuel Ford on 6/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // these are all common or recommended approaches to
            // non-sheet modals in swiftui
            //
            // however, none of them make possible a fullscreen
            // modal that works in all scenarios with transparency
            // and full control over the ui
            
            ZStackModal()
                .tabItem {
                    Label("ZStack", systemImage: "xmark.circle")
                }
            
            OverlayTest()
                .tabItem {
                    Label("Overlay", systemImage: "xmark.circle")
                }
            
            SheetExample()
                .tabItem {
                    Label("Sheet", systemImage: "xmark.circle")
                }
            
            FullScreenCoverExample()
                .tabItem {
                    Label("Full Screen Cover", systemImage: "xmark.circle")
                }
            
            // WORKAROUND:
            //
            // this is a workaround we have used that drops down
            // to UIKit to leverage `present(_:animated:completion:)`
            //
            // it would be useful if swiftui offered similar
            // behavior
            
            PresentAsModalTest()
                .tabItem {
                    Label("UIKit", systemImage: "checkmark.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
