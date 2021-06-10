#  SwiftUI Limited Modal Capabilites

In order to present a full screen modal that supports transparency and multiple transition styles (not just sheet or from bottom), 
it is necessary to work outside of SwiftUI's capabilities.

This sample app shows four approaches leveraging a SwiftUI only technique demonstrating that all four to not meet the requirement.

It also shows the desired result only possible by leveraging UIKit's presentation capabilites with a custom view modifier that 
wraps a `UIHostingViewController` to present a view.

It may be better if SwiftUI offered an idiomatic solution rather than having to drop down to the underlying framework.
