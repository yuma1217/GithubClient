//
//  GithubUserViewModel.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import Foundation

class GithubUserViewModel : ObservableObject{
    @Published var users : [GithubUser] = []
    
    func reload() async {
        let url = URL(string: "https://api.github.com/users")!
        let urlSession = URLSession.shared
        
        do{
            let (data, response) = try await urlSession.data(from: url)
            self.users = try JSONDecoder().decode([GithubUser].self, from: data)

            print(self.users[0].login)
        }
        catch{
            debugPrint("Error handling \(url)")
            debugPrint(error)
        }
    }
}
