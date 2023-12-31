//
//  NewsAPI.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 15/11/23.
//

import Foundation

struct NewsAPI {
    
    static let shared = NewsAPI()
    private init() {}
    
    private let apikey = "900d912896214c40ac22431a63a54118"
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetch(from category: Category) async throws -> [Article] {
        let url = generateNewsURL(from: category)
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            throw generateError(description: "Bad Response")
        }
        
        switch response.statusCode {
            case (200...299), (400...499):
            let apiResponse = try jsonDecoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            }
            else{
                throw generateError(description: apiResponse.message ?? "An Error Ocurred")
            }
        default:
            throw generateError(description: "A Server Error Ocurred")

        }
    }
    
    private func generateError(code: Int = 1, description: String) -> Error{
        NSError(domain: "NewsAPI", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
    
    private func generateNewsURL(from category: Category) -> URL {
        var url = "https://newsapi.org/v2/top-headlines?"
        url += "apiKey=\(apikey)"
        url += "&language=en"
        url += "&category=\(category.rawValue)"
        
        return URL(string: url)!
    }
}
