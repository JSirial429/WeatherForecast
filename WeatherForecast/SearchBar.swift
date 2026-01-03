//
//  SearchBar.swift
//  Tempus
//
//  Created by Jorge Sirias on 1/1/26.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText: String
    
    var body: some View {
        HStack(spacing: 8){
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24))
            
            TextField("Search", text: $searchText)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding([.leading, .trailing])
        .offset(x:0,y:-320)
    }
}

#Preview {
    SearchBar(searchText: "")
}
