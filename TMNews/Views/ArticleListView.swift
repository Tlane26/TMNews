//
//  ArticleListView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 15/11/23.
//

import SwiftUI

struct ArticleListView: View {
    
    @State private var selectedArticle: Article?
    
    let articles: [Article]
    
    
    var body: some View {
            
                
            List{
                ForEach(articles) { article in
                    ArticleRowView(article: article)
                        .onTapGesture{
                            selectedArticle = article
                        }
                    Divider()
                        .background(Color.gray)
                        .padding(.horizontal, 20)
                        .accessibility(label: Text("Separator between articles"))
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        /*
            .sheet(item: $selectedArticle){
                SafariView(url: $0.articleURL)
                    .edgesIgnoringSafeArea(.bottom)
            }*/
        
        }
}

#Preview {
    NavigationView {
        ArticleListView(articles: Article.previewData)
    }
}
