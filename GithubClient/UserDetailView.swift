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
            AsyncImage(url: URL(string: viewModel.user.avatar_url)){
                image in
                image.resizable()
            } placeholder: {
                Text("test")
            }
            Text("userName: " + viewModel.user.login)
            if viewModel.user.name != nil{
                Text(viewModel.user.name!)
            }else{
                Text("名前がありません")
            }
            
            if viewModel.user.followers != nil && viewModel.user.following != nil{
                HStack{
                    Text("フォロワー数：")
                    Text(String(viewModel.user.followers!))
                }
                HStack{
                    Text("フォロイー数：")
                    Text(String(viewModel.user.following!))
                }
            }else{
                Text("情報がありません")
            }
            
            NavigationView{
                List(viewModel.repositories){repository in
                    RepositoryRowView(repository: repository)
                }.navigationTitle("リポジトリ")
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
