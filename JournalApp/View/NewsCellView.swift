//
//  NewsCellView.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 21.12.23.
//

import SwiftUI

struct NewsCellView: View {
    // MARK: - Properties
    var newsItem: NewsItem
    @ObservedObject var viewModel: NewsListViewModel

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(newsItem.title)
                    .font(.headline)
                Spacer()
                Label(viewModel.dateFormatter.string(from: newsItem.date), systemImage: "calendar")
                    .font(.caption)
            }
            .padding(.vertical, 10)
            
            Text(newsItem.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.vertical, 10)

            Text(newsItem.category.rawValue)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .padding(5)
                .background(Color.blue.opacity(0.1))
                .foregroundColor(.blue)
                .clipShape(Capsule())
                .padding(.vertical, 10)
        }
    }
}
