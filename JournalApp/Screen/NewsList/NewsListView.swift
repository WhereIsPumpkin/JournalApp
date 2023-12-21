//
//  NewsListView.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.news.isEmpty {
                    emptyStateView
                } else {
                    newsList
                }
            }
            .navigationBarTitle("Daily News 🗞️", displayMode: .inline)
            .navigationBarItems( trailing: addNews )
            .sheet(isPresented: $viewModel.showingAddNewsView) {
                AddNewsView()
            }
        }
    }
    
    // MARK: - Private Views
    private var addNews: some View {
        Button(action: {
            viewModel.showingAddNewsView = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private var emptyStateView: some View {
        VStack {
            Image(systemName: "newspaper")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding()
            Text("No news yet!")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
    
    private var newsList: some View {
        List {
            ForEach($viewModel.news) { $newsItem in
                NewsCellView(newsItem: newsItem, viewModel: viewModel)
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteNews(at: newsItem.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button(action: {
                            newsItem.isFavorite.toggle()
                        }, label: {
                            Label(newsItem.isFavorite ? "Unstar" : "Star", systemImage: newsItem.isFavorite ? "star.slash.fill" : "star")
                        })
                        .tint(.orange)
                    }
            }
            .onMove(perform: viewModel.moveNews)
        }
    }
}

#Preview {
    NewsListView()
        .environmentObject(NewsListViewModel())
}


