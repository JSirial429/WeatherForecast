//
//  SearchBar.swift
//  Tempus
//
//  Created by Jorge Sirias on 1/1/26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var performSearch: Bool
    @Binding var isSearchBarVisible: Bool
    
    var body: some View {
        HStack{
            HStack(spacing: 8){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundStyle(.tint)
                
                TextField("Search", text: $searchText)
                    .onSubmit {performSearch.toggle()}
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            //.padding([.leading, .trailing])
            //.offset(x:0,y:-320)
            
            HStack{
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        searchText = ""
                    }
                }, label: {
                    Image(systemName:"xmark")
                })
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        isSearchBarVisible.toggle()
                    }
                }, label: {
                    Image(systemName:"checkmark")
                })
            }
        }
        .padding([.leading, .trailing])
        .transition(.asymmetric(insertion: .slide.combined(with: .opacity),
                            removal: .move(edge: .leading).combined(with: .opacity)))
    }
}

#Preview {
    @Previewable @State var selectedLocation: String = "Miami"
    @Previewable @State var performSearch: Bool = false
    @Previewable @State var isSearchBarVisible: Bool = false
    SearchBar(searchText: $selectedLocation, performSearch: $performSearch, isSearchBarVisible: $isSearchBarVisible)
}
