//
//  NewsListViewModel.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import Foundation

final class NewsListViewModel: ObservableObject {
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
    func deleteNews(at id: UUID) {
        if let index = news.firstIndex(where: { $0.id == id }) {
            news.remove(at: index)
        }
    }
    
    func moveNews(from source: IndexSet, to destination: Int) {
        news.move(fromOffsets: source, toOffset: destination)
    }
    
    func saveNews() {
        guard !title.isEmpty, !description.isEmpty else {
            showingAlert = true
            return
        }
        news.append( NewsItem(title: title, description: description, category: category) )
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

