//
//  UserRowView.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/16.
//

import SwiftUI

struct UserRowView: View {
    var user : GithubUser
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.avatar_url)){
                image in
                image.resizable()
            } placeholder: {
                Image(systemName: "arrow.triangle.2.circlepath")
            }
                .frame(width: 50, height: 50)
            Text(user.login)
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        UserRowView(user: testUser)
    }
}
