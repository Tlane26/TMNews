//
//  NewsTabView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 19/11/23.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        
        NavigationStack{
            ArticleListView(articles: articles)
                .overlay(overlayView)
            
                .refreshable {
                    loadTask()
                }
                .onAppear{
                    loadTask()
                }
                .onChange(of: articleNewsVM.selectedCategory, perform: { _ in
                    loadTask()
                    
                })
                .navigationTitle("Top Stories")
                .navigationBarItems(trailing: menu )
                .navigationBarItems(leading: 
                                        Image("Elogo")
                                            .resizable()
                                            .frame(width: 45)
                
                )
                
            
            
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch articleNewsVM.phase {
            case .empty: ProgressView()
            case .success(let articles) where articles.isEmpty: EmptyPlaceholderView(text: "No articles", image: nil)
            case .failure(let error): RetryView(text: error.localizedDescription){
                    loadTask()
                }
            default: EmptyView()
        }
    
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase{
            return articles
        }
        else{
            return []
        }
    }
    
    private func loadTask() {
        Task.init{
            await articleNewsVM.loadArticles()
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.selectedCategory){
                ForEach(Category.allCases){
                    Text($0.text).tag($0)
                }
            }
            .accessibilityLabel("Category Menu")
        } label: {
            
            Image(systemName: "fiberchannel")
                .imageScale(.large)
                .accessibilityLabel("Category Menu")
        }
    }
}


#Preview {
    NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
}
