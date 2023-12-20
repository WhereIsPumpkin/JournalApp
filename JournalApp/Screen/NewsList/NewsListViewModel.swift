//
//  NewsListViewModel.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import Foundation

class NewsListViewModel: ObservableObject {
    // MARK: - NewsList Properties
    @Published var news: [NewsItem] = []
    @Published var showingAddNewsView = false
    
    // MARK: - Form Input Properties
    @Published var title = ""
    @Published var description = ""
    @Published var category = NewsCategory.politics
    @Published var showingAlert = false
    @Published var date = Date()
    
    // MARK: - Methods
    func deleteNews(at offsets: IndexSet) {
        news.remove(atOffsets: offsets)
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        news.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveNews() {
        guard !title.isEmpty, !description.isEmpty else {
            showingAlert = true
            return
        }
        let newsItem = NewsItem(title: title, description: description, category: category)
        news.append(newsItem)
        showingAddNewsView = false
        title = ""
        description = ""
        category = .politics
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

