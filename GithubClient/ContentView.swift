//
//  ContentView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : GithubUserViewModel = GithubUserViewModel()
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                SearchUserView(viewModel: viewModel)
                List(viewModel.users){user in
                    NavigationLink{
                        UserDetailView(viewModel: UserDetailViewModel(user: user))
                    }label: {
    //                    Text(user.login)
                        UserRowView(user: user)
                    }
                }
                .navigationTitle("ユーザーリスト")
                .navigationBarTitleDisplayMode(.inline)
//                .task {
//                    await viewModel.reload()
//                }
                .refreshable {
        //            print(viewModel.users)
        //            print(viewModel.users[0].login)
        //            print(viewModel.users[1].login)
                    print(viewModel.users.count)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
