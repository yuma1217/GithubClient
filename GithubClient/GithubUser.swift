//
//  GitHubUser.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/15.
//

import Foundation
struct GithubUser : Identifiable, Codable{
    
    var id : Int
    var login : String // USER名
    var avatar_url : String
//    var followers_url : String // GETで叩くとUserのリストが返ってくるのでその数で判定できる
//    var following_url : String
    var url : String // UserAPIのURLが取得できる
    var repos_url : String
    
    // UserAPIで取得できる情報
    var followers : Int?
    var following : Int?
    var name : String?

}

var testUser : GithubUser = GithubUser(id: 3, login: "test", avatar_url: "https://avatars.githubusercontent.com/u/4?v=4", url: "test", repos_url: "https", name: "名前")
