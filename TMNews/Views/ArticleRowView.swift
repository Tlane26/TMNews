//
//  ArticleRowView.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 14/11/23.
//

import SwiftUI

struct ArticleRowView: View {
    
   let article: Article
    
    var body: some View {
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
                    .lineLimit(2)
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(2)
                
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
            .padding()
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView {
            List{
                ArticleRowView(article: .previewData[1])
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}
