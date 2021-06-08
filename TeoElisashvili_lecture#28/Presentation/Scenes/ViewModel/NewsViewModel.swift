//
//  NewsViewModel.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit

struct NewsViewModel {
    
    private var news: News
    
    init(news: News) {
        self.news = news
    }

    var author: String {
        news.author ?? ""
    }

    var description: String {
        news.description ?? ""
    }

    var urlToImage: URL? {
        URL(string: news.urlToImage ?? "")
    }

    var publishedAt: String {
//        "\(news.publishedAt ?? "")"
        let editted = "\(news.publishedAt?.dropFirst(11) ?? "")"
        return "\(editted.dropLast(1))"
    }
}
