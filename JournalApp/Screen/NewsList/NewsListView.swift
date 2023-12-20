//
//  NewsListView.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.news.isEmpty {
                    emptyStateView
                } else {
                    newsList
                }
            }
            .navigationBarTitle("News", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    viewModel.showingAddNewsView = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $viewModel.showingAddNewsView) {
                AddNewsView()
            }
        }
    }
    
    private var emptyStateView: some View {
        Text("📰 No news yet! Click on the ➕ above to add some! 🚀")
            .font(.headline)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var newsList: some View {
        List {
            ForEach($viewModel.news) { $newsItem in
                VStack(alignment: .leading) {
                    Text(newsItem.title)
                        .font(.headline)
                    Text(newsItem.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(newsItem.category.rawValue)
                            .font(.caption)
                            .foregroundColor(.blue)
                        Spacer()
                        Text(viewModel.dateFormatter.string(from: newsItem.date))
                            .font(.caption)
                    }
                }
                
            }
            .onDelete(perform: viewModel.deleteNews)
            .onMove(perform: viewModel.moveNews)
        }
    }
}

#Preview {
    NewsListView()
        .environmentObject(NewsListViewModel())
}


