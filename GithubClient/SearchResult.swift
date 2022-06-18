//
//  SearchResult.swift
//  GithubClient
//
//  Created by 松村 裕 on 2022/06/18.
//

import Foundation
struct SearchResult: Codable{
    var total_count: Int
//      "incomplete_results": false,
    var items: [GithubUser]
}
