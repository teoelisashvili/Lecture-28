//
//  NewsResponse.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit

struct NewsResponse: Codable {
    let newsList: [News]
    
    enum CodingKeys: String, CodingKey {
        case newsList = "articles"
    }
}
