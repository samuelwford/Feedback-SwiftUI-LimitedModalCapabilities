//
//  PresentAsModalModifier.swift
//  LaL
//
//  Created by Ford, Samuel on 5/21/21.
//

import SwiftUI

extension View {
    /// Presents a view modally based on the value of the binding.
    /// - Parameters:
    ///   - isPresented: A binding to whether the modal view is presented.
    ///   - modalPresentationStyle: The presentation style to use when presenting the modal. Defaults to `.overFullScreen`.
    ///   - modalTransitionStyle: The transition style to use when presenting the modal. Defaults to `.crossDissolve`.
    ///   - isTransparent: Whether the modal view is presented over a transparent backing view. Defaults to `true`.
    ///   - content: A closure returning the modal view to present.
    func modal<ModalContent: View>(isPresented: Binding<Bool>, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen, modalTransitionStyle: UIModalTransitionStyle = .crossDissolve, isTransparent: Bool = true, @ViewBuilder content: @escaping () -> ModalContent) -> some View {
        modifier(PresentAsModalModifier(isPresented: isPresented, modalPresentationStyle: modalPresentationStyle, modalTransitionStyle: modalTransitionStyle, isTransparent: isTransparent, content: content))
    }
}

/// A modifier that presents a view modally.
struct PresentAsModalModifier<ModalContent: View>: ViewModifier {
    let isPresented: Binding<Bool>
    let modalPresentationStyle: UIModalPresentationStyle
    let modalTransitionStyle: UIModalTransitionStyle
    let isTransparent: Bool
    let modalContent: () -> ModalContent
    
    /// Creates a modifier to present a view modally.
    /// - Parameters:
    ///   - isPresented: A binding to whether the modal view is presented.
    ///   - modalPresentationStyle: The presentation style to use when presenting the modal. Defaults to `.overFullScreen`.
    ///   - modalTransitionStyle: The transition style to use when presenting the modal. Defaults to `.crossDissolve`.
    ///   - isTransparent: Whether the modal view is presented over a transparent backing view. Defaults to `true`.
    ///   - content: A closure returning the modal view to present.
    init(isPresented: Binding<Bool>, modalPresentationStyle: UIModalPresentationStyle = .overFullScreen, modalTransitionStyle: UIModalTransitionStyle = .crossDissolve, isTransparent: Bool = true, @ViewBuilder content: @escaping () -> ModalContent) {
        self.isPresented = isPresented
        self.modalPresentationStyle = modalPresentationStyle
        self.modalTransitionStyle = modalTransitionStyle
        self.isTransparent = isTransparent
        self.modalContent = content
    }
    
    func body(content: Content) -> some View {
        content
            .background(
                PresentAsModalView(
                    isPresented: isPresented,
                    modalPresentationStyle: modalPresentationStyle,
                    modalTransitionStyle: modalTransitionStyle,
                    isTransparent: isTransparent,
                    content: modalContent))
    }

}

private struct PresentAsModalView<Content: View>: View {
    @Binding var isPresented: Bool
    let modalPresentationStyle: UIModalPresentationStyle
    let modalTransitionStyle: UIModalTransitionStyle
    let isTransparent: Bool
    let content: () -> Content
    
    init(isPresented: Binding<Bool>, modalPresentationStyle: UIModalPresentationStyle, modalTransitionStyle: UIModalTransitionStyle, isTransparent: Bool, @ViewBuilder content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.modalPresentationStyle = modalPresentationStyle
        self.modalTransitionStyle = modalTransitionStyle
        self.isTransparent = isTransparent
        self.content = content
    }
    
    var body: some View {
        if isPresented {
            Color.clear
                .onAppear {
                    present()
                }
        } else {
            EmptyView()
        }
    }
    
    var rootViewController: UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
    
    func present() {
        let vc = UIHostingController(rootView: content().onTapGesture {
            dismiss()
        })
        
        if isTransparent {
            vc.view.backgroundColor = .clear
            vc.view.isOpaque = false
        }
        
        vc.modalPresentationStyle = modalPresentationStyle
        vc.modalTransitionStyle = modalTransitionStyle
        
        rootViewController?.present(vc, animated: true)
    }
    
    func dismiss() {
        rootViewController?.dismiss(animated: true)
        isPresented = false
    }
}
