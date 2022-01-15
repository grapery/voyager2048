//
//  ButtonView.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/10.
//

import SwiftUI

typealias ButtonAction = () -> Void

struct ButtonView: View {
    private let label: String
    private let action: ButtonAction
    
    init (label: String, action: @escaping ButtonAction) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .frame(maxWidth: .infinity, maxHeight: 50)
        }).accessibilityLabel(label)
    }
}

struct InputTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.background)
                    .shadow(color: Color.theme.accent.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            )
    }
}

struct InputPasswordView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.background)
                    .shadow(color: Color.theme.accent.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            )
    }
}


struct CircleButtonAnimationView: View {
    @Binding var animate : Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0 )
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
    }
}

struct CircleButtonView: View {
    let iconName : String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            .padding()
    }
}



