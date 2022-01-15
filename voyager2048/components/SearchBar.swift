//
//  SearchBar.swift
//  voyager2048
//
//  Created by grapestree on 2022/1/13.
//

import Foundation
import SwiftUI


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
