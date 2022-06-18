//
//  UserDetailView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject var viewModel : UserDetailViewModel
//    var subColor = Color(red: 139.0, green: 148.0, blue: 158.0)
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                // アイコン画像
                AsyncImage(url: URL(string: viewModel.user.avatar_url)){
                    image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        
                }.padding(.leading)
                
                // ユーザー名と名前
                VStack(alignment: .leading){
                    if viewModel.user.name != nil{
                        Text(viewModel.user.name!)
                            .bold()
                    }else{
                        Text("未設定")
                    }
                    Text(viewModel.user.login)
                        .foregroundColor(.gray)
                    
                    // フォロワー数とフォロイー数
                    if viewModel.user.followers != nil && viewModel.user.following != nil{
                        HStack{
                            Text(String(viewModel.user.followers!))
                                .bold()
                            Text("followers")
                                .foregroundColor(.gray)
                            Text(String(viewModel.user.following!))
                                .bold()
                            Text("following")
                                .foregroundColor(.gray)
                        }
                    }else{
                        Text("情報がありません")
                    }
                }
            }
            
            // リポジトリリスト
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
