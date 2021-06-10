//
//  ZStackModal.swift
//  SwiftUIPresentAsModal
//
//  Created by Samuel Ford on 6/9/21.
//

import SwiftUI

extension View {
    func zstackModal<ModalContent: View>(isPresented: Binding<Bool>, @ViewBuilder modalContent: @escaping () -> ModalContent) -> some View {
        modifier(ZStackModalModifier(isPresented: isPresented, modalContent: modalContent))
    }
}

struct ZStackModalModifier<ModalContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let modalContent: () -> ModalContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                modalContent()
                    .onTapGesture {
                        isPresented = false
                    }
            }
        }
        .animation(.default, value: isPresented)
    }
}

struct ZStackModal: View {
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("This method WILL NOT cover the TabBar")
                .bold()
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Say Hello with a ZStack Modal") {
                isPresented = true
            }
            .buttonStyle(BasicButtonStyle(color: .blue))
        }
        .padding()
        .zstackModal(isPresented: $isPresented) {
            MessageView(message: "Hello, ZStack Modally")
        }
    }
}

struct ZStackModal_Previews: PreviewProvider {
    static var previews: some View {
        ZStackModal()
    }
}
