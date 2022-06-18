//
//  UserDetailViewModel.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import Foundation
class UserDetailViewModel : ObservableObject{
    @Published var user : GithubUser
    @Published var repositories : [Repository] = []
    init(user: GithubUser){
        self.user = user
    }
    
    // ユーザーの詳細情報を取得する
    func getUserData() async {
        let url = URL(string: self.user.url)!
        let urlSession = URLSession.shared
        
        do{
            let (data, response) = try await urlSession.data(from: url)
            self.user = try JSONDecoder().decode(GithubUser.self, from: data)
            print("getUserData")
        }
        catch{
            debugPrint("Error handling \(url)")
            debugPrint(error)
        }
    }
    
    // ユーザーが持っているリポジトリの情報を取得する
    func getRepositoryData() async {
        let url = URL(string: self.user.repos_url)!
        let urlSession = URLSession.shared
        do{
            let (data, response) = try await urlSession.data(from: url)
            self.repositories = try JSONDecoder().decode([Repository].self, from: data)
        }catch{
            debugPrint("getRepositoryData error")
            debugPrint(error)
        }
        // forkのものを取り除く
        self.repositories = self.repositories.filter{
            $0.fork == false
        }
    }
}
