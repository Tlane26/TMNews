//
//  ArticleRowView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 14/11/23.
//

import SwiftUI

struct ArticleRowView: View {
    
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @State private var showFullText = false
    @State private var isSafariViewPresented = false
    
   let article: Article
    
    var body: some View {
        if dynamicTypeSize >= .xLarge{
            ScrollView{
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: article.imageURL){ phase in
                        switch phase {
                            case .empty:
                            HStack{
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .padding(.horizontal, 20)
                                    .aspectRatio(contentMode: .fill)
                                
                            case .failure:
                            HStack{
                                Spacer()
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                Spacer()
                            }
                            
                            @unknown default:
                                Image(systemName: "photo")
                        }
                    }
                    .frame(minHeight: 200, maxHeight: 300)
                    .clipped()
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text(article.source.name)
                            .foregroundStyle(.red)
                        Text(article.title)
                            .font(.headline)
                            
                        Text(article.descriptionText)
                            .font(.subheadline)
                        
                        HStack{
                            Text(article.captionText)
                                .font(.caption)
                            
                            Spacer()
                            
                            Button{
                                
                            } label: {
                                Image(systemName: "bookmark")
                                    .foregroundStyle(.black)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        else{
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    AsyncImage(url: article.imageURL){ phase in
                        switch phase {
                            case .empty:
                            HStack{
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .padding(.horizontal, 20)
                                    .aspectRatio(contentMode: .fill)
                                
                            case .failure:
                            HStack{
                                Spacer()
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                Spacer()
                            }
                            
                            @unknown default:
                                Image(systemName: "photo")
                        }
                    }
                    .frame(minWidth: 350, maxWidth: 350, minHeight: 200, maxHeight: 250)
                    .clipped()
                    Spacer()
                }
                
                VStack(alignment: .leading, spacing: 8){
                    Text(article.source.name)
                        .foregroundStyle(.red)
                    Text(article.title)
                        .font(.headline)
               
                    if dynamicTypeSize >= .medium{
                        ScrollView{
                            Text(article.descriptionText)
                                .font(.subheadline)
                        }
                    }
                    else{
                        Text(article.descriptionText)
                            .font(.subheadline)
                    }
                    HStack{
                        Text(article.captionText)
                            .font(.caption)
                        
                        Spacer()
                        
                        Button{
                            isSafariViewPresented.toggle()
                        } label: {
                            Image(systemName: "safari")
                                .foregroundStyle(.black)
                                .accessibility(label: Text("Open New In Safari Button"))
                        }
                        .buttonStyle(.bordered)
                        .sheet(isPresented: $isSafariViewPresented) {
                            SafariView(url: article.articleURL)
                            .edgesIgnoringSafeArea(.bottom)
                            
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView {
            List{
                ArticleRowView(article: .previewData[1])
                    .listRowInsets(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}
