//
//  Category.swift
//  TMNews
//
//  Created by Tlanetzi Chavez Madero on 15/11/23.
//

import Foundation

enum Category: String, CaseIterable{
    case general
    case bussiness
    case technology
    case entertaiment
    case sports
    case science
    case healt
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
