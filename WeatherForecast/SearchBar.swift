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
    @State var isEditing: Bool = false
    
    var body: some View {
        HStack{
            HStack(spacing: 8){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 24))
                    .foregroundStyle(.tint)
                
                TextField("Search", text: $searchText)
                    .font(.subheadline.bold())
                    .fontDesign(Font.Design.rounded)
                    .foregroundStyle(Color.blue)
                    .onTapGesture {
                        isEditing = true
                    }
                    .onChange(of: searchText){
                        if searchText.count != 0{
                            isEditing = true
                        }else{
                            isEditing = false
                        }
                    }
                    .onSubmit {performSearch.toggle()}
                
                if isEditing{
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)){
                            isEditing = false
                            searchText = ""
                        }
                    }, label: {
                        Image(systemName:"xmark")
                            .foregroundStyle(Color.red)
                    })
                }
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            //.padding([.leading, .trailing])
            //.offset(x:0,y:-320)
            
            HStack{
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
