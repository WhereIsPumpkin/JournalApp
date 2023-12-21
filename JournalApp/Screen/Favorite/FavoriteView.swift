//
//  FavoriteView.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.news.filter({ $0.isFavorite }).isEmpty {
                    emptyStateView
                } else {
                    favoriteNewsList
                }
            }
            .navigationBarTitle("Favorite News", displayMode: .inline)
        }
    }
    
    private var emptyStateView: some View {
        VStack {
            Image(systemName: "star.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
                .padding()
            Text("No Favorite News")
                .font(.headline)
                .foregroundColor(.secondary)
        }
    }
    
    private var favoriteNewsList: some View {
        List {
            ForEach($viewModel.news) { $newsItem in
                if newsItem.isFavorite {
                    NewsCellView(newsItem: newsItem, viewModel: viewModel)
                        .swipeActions {
                            Button(action: {
                                newsItem.isFavorite.toggle()
                            }, label: {
                                Label(newsItem.isFavorite ? "Unstar" : "Star", systemImage: newsItem.isFavorite ? "star.slash.fill" : "star")
                            })
                            .tint(.orange)
                        }
                }
                
            }
            
            .onMove(perform: viewModel.moveNews)
        }
    }
    
}
