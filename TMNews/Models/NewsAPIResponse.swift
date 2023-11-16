//
//  NewsAPIResponse.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 14/11/23.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
