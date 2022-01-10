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


struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .disableAutocorrection(true)
                .foregroundColor(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            TextField("Search by name or symbol...", text: $searchText)
                .accessibility(identifier: "SearchTextField")
                .foregroundColor(Color.theme.accent)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        },
                    alignment: .trailing
                )

        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        )
        .padding()
    }
}

