//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import SwiftUI

@main
struct JournalApp: App {
    
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NewsListView()
                    .tabItem {
                        Label("News", systemImage: "newspaper.fill")
                    }
                FavoriteView()
                    .tabItem {
                        Label("Favorites", systemImage: "star.fill")
                    }
            }
            .environmentObject(viewModel)
        }
    }
}
