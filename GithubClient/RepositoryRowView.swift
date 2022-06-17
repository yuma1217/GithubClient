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
        VStack(alignment: .leading){
            // リポジトリ名, star, language
            HStack {
                Text(repository.name)
                    .bold()
                Spacer()
                if repository.language != nil{
                    Text(repository.language!)
                }else{
                    Text("無")
                }
                HStack(spacing: 0){
                    Image(systemName: "star")
                    Text(String(repository.stargazers_count))
                }
            }
            
            // リポジトリの説明
            if repository.description != nil{
                Text(repository.description!)
                    .foregroundColor(.gray)
            }else{
                Text("説明文なし")
                    .foregroundColor(.gray)
            }

        }
    }
}

struct RepositoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            RepositoryRowView(repository: testRepository)
            RepositoryRowView(repository: testRepository2)
        }
    }
}
