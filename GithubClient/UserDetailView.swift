//
//  UserDetailView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject var viewModel : UserDetailViewModel
    var body: some View {
        
        VStack{
            HStack{
                AsyncImage(url: URL(string: viewModel.user.avatar_url)){
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                } placeholder: {
                    Text("test")
                }
                VStack(alignment: .leading){
                    if viewModel.user.name != nil{
                        Text(viewModel.user.name!)
                            .bold()
                    }else{
                        Text("名前がありません")
                    }
                    Text(viewModel.user.login)
                }
                if viewModel.user.followers != nil && viewModel.user.following != nil{
                    HStack{
                        Text("followers")
                        Text(String(viewModel.user.followers!))
                    }
                    HStack{
                        Text("following")
                        Text(String(viewModel.user.following!))
                    }
                }else{
                    Text("情報がありません")
                }
            }
            List(viewModel.repositories){repository in
                NavigationLink{
                    RepositoryDetailView(url: URL(string: repository.html_url)!)
                }label: {
                    RepositoryRowView(repository: repository)
                }
            }
        }
        .task {
            await viewModel.getUserData()
            await viewModel.getRepositoryData()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {

    static var viewModel : UserDetailViewModel = UserDetailViewModel(user: testUser)
    static var previews: some View {
        UserDetailView(viewModel: viewModel)
    }
}
