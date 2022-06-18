//
//  Repositry.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/16.
//

import Foundation
struct Repository : Identifiable, Codable{
    
    var id : Int
    var name : String
    var fork : Bool // forkされてるかどうか
    var html_url : String // WebViewで表示するページ
    var language : String? // 開発言語
    var stargazers_count : Int // スター数
    var description : String? // 説明文
}

var testRepository = Repository(id: 3, name: "GithubClient", fork: false, html_url: "https://github.com/yuma1217/GithubClient", language: "Swift", stargazers_count: 0)
var testRepository2 = Repository(id: 4, name: "matsumura-yu.github.io", fork: false, html_url: "https://github.com/yuma1217/matsumura-yu.github.io", language: "C#", stargazers_count: 0, description: "Webページをホストする")
