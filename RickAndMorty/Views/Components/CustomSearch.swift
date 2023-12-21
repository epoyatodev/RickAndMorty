//
//  CustomSearch.swift
//  RickAndMorty
//
//  Created by enrique.poyato on 17/11/23.
//

import SwiftUI

struct CustomSearch: View {
    @FocusState private var isFocused: Bool
    @Binding var searchText: String
    var body: some View {
        TextField("", text: $searchText)
            .padding(.vertical, 4)
            .padding(.leading, 25)
            .background(.secondary.opacity(0.1))
            .shadow(radius: 5, x: 5, y: 5)
            .clipShape(.rect(cornerRadius: 6))
            .padding(.horizontal)
            .overlay(alignment: .leading) {
                HStack(spacing: 4) {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 22)
                    Text(searchText.isEmpty ? "Search..." : "")
                    
                }
                .foregroundStyle(.gray)
                .onTapGesture {
                    isFocused = true
                }
            }
            .focused($isFocused)
        
    }
}

#Preview {
    CustomSearch(searchText: .constant(""))
}
