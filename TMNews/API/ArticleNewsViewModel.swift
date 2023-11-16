//
//  ArticleNewsViewModel.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 15/11/23.
//

import SwiftUI

enum DataFetchPhase<T> {
    case empty
    case sucess(T)
    case failure(Error)
}

@MainActor
class ArticleNewsViewModel : ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var selectedCategory: Category
    private let newsAPI = NewsAPI.shared
    
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general){
        if let articles = articles {
            self.phase = .sucess(articles)
        }
        else{
            self.phase = .empty
        }
        self.selectedCategory = selectedCategory
    }
    
    func  loadArticles() async {
        phase = .empty
        do {
            let articles = try await newsAPI.fetch(from: selectedCategory)
            phase = .sucess(articles)
        } catch {
            phase = .failure(error)
        }
    }
}
