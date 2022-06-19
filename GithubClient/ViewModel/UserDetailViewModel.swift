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
            let (data, _) = try await urlSession.data(from: url)
            self.user = try JSONDecoder().decode(GithubUser.self, from: data)
            print("repo: \(self.user.public_repos)")
        }
        catch{
            debugPrint("Error handling \(url)")
            debugPrint(error)
        }
    }
    
    // ユーザーが持っているリポジトリの情報を取得する
    func getRepositoryData() async {
        // リポジトリAPIの仕様
        // per_page : default 30
        // page : default 1
        
        self.repositories.removeAll()
        
        guard var repositoryNum = self.user.public_repos else { fatalError() }
        
        var page : Int = 0
        
        repeat{
            page += 1
            var urlComponents = URLComponents(string: self.user.repos_url)
            urlComponents?.queryItems = [
                URLQueryItem(name: "per_page", value: "100"),
                URLQueryItem(name: "page", value: String(page))
            ]
            guard let url = urlComponents?.url else { fatalError() }
            print(url)
            let urlSession = URLSession.shared
            var tmpRepositories : [Repository] = []
            do{
                let (data, _) = try await urlSession.data(from: url)
                tmpRepositories = try JSONDecoder().decode([Repository].self, from: data)
            }catch{
                debugPrint("getRepositoryData error")
                debugPrint(error)
            }
            // forkのものを取り除く
            self.repositories += tmpRepositories.filter{
                $0.fork == false
            }
            
            repositoryNum -= 100
        }while(repositoryNum > 0)
        
        print(self.repositories.count)
    }
}
