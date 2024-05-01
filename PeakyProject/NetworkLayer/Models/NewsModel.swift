//
//  NewsModel.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 30/4/24.
//

import Foundation

struct NewsModel: Codable {
    let results: [ResultsModel]
    let nextPage: String?
}

struct ResultsModel: Codable {
    let article_id: String
    let title: String
    let creator: [String]?
    let description: String?
    let pubDate: String
    let image_url: String?
    let source_id: String
    let source_icon: String?
    let language: String
    let country: [String]
    let category: [String]
}
