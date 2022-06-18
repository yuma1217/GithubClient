//
//  SearchUserView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/17.
//

import SwiftUI

struct SearchUserView: View {
    @State var searchText = ""
    @State var isEditing = false
    @StateObject var viewModel : GithubUserViewModel
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchText, onEditingChanged: {isEditing in
                self.isEditing = isEditing
            })
            .onSubmit {
                Task{
                    await viewModel.search(searchText: self.searchText)
                }
            }
            if isEditing{
                Button(action: {
                    self.searchText = ""
                }){
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
//        .background(Color(.systemGray6))
//        .padding([.horizontal, .top])
    }
}

struct SearchUserView_Previews: PreviewProvider {
    static var viewModel = GithubUserViewModel()
    static var previews: some View {
        SearchUserView(viewModel: viewModel)
    }
}
