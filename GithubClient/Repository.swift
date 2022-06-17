//
//  Repositry.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/16.
//

import Foundation
struct Repository : Identifiable, Codable{
    // リポジトリ名、開発言語、スター数、説明文
    // ただしForkでないもの
    var id : Int
    var name : String
    var fork : Bool
    var html_url : String
    var language : String?
    var stargazers_count : Int
    var description : String?
}

var testRepository = Repository(id: 3, name: "GithubClient", fork: false, html_url: "https://github.com/yuma1217/GithubClient", language: "Swift", stargazers_count: 0)
var testRepository2 = Repository(id: 4, name: "matsumura-yu.github.io", fork: false, html_url: "https://github.com/yuma1217/matsumura-yu.github.io", language: "C#", stargazers_count: 0, description: "Webページをホストする")
