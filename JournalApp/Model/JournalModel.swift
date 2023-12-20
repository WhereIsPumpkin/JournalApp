//
//  JournalModel.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import Foundation

struct NewsItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date = Date()
    var category: NewsCategory
    var isFavorite: Bool = false
}

enum NewsCategory: String, CaseIterable, Identifiable {
    case politics = "Politics"
    case sports = "Sports"
    case technology = "Technology"
    case entertainment = "Entertainment"
    case health = "Health"
    case business = "Business"

    var id: String { self.rawValue }
}

