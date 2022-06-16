//
//  RepositoryRowView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/16.
//

import SwiftUI

struct RepositoryRowView: View {
    var repository : Repository
    
    var body: some View {
        HStack {
            Text(repository.name)
            if repository.language != nil{
                Text(repository.language!)
            }else{
                Text("無")
            }
            Image(systemName: "star.fill")
            Text(String(repository.stargazers_count))
            if repository.description != nil{
                Text(repository.description!)
            }else{
                Text("説明文なし")
            }
        }
    }
}

struct RepositoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRowView(repository: testRepository)
    }
}
