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

var testRepository = Repository(id: 3, name: "test", fork: false, html_url: "https", language: "Go", stargazers_count: 3)
