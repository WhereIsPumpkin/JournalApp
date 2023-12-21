//
//  AddNewsView.swift
//  JournalApp
//
//  Created by Saba Gogrichiani on 20.12.23.
//

import SwiftUI

struct AddNewsView: View {
    @EnvironmentObject var viewModel: NewsListViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Form {
                newsDetails
                
                Section {
                    Button("Add News") {
                        viewModel.saveNews()
                    }
                }
            }
            .navigationBarTitle("Add News", displayMode: .inline)
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Missing Information"), message: Text("Please fill in all fields before adding news."), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    
    // MARK: - Private Views
    
    private var newsDetails: some View {
        Section(header: Text("News Details")) {
            TextField("Title", text: $viewModel.title)
            
            TextEditor(text: $viewModel.description)
            
            DatePicker(selection: $viewModel.date, displayedComponents: .date, label: { Text("Date") })
            
            Picker("Category", selection: $viewModel.category) {
                ForEach(NewsCategory.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
        }
    }
    
}

