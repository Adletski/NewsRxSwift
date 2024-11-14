//
//  Article.swift
//  NewsRxSwift
//
//  Created by Adlet Zhantassov on 14.11.2024.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
