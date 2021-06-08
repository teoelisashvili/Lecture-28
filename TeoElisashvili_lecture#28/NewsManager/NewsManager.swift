//
//  NewsManager.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit

protocol NewsManagerProtocol: AnyObject {
    func fetchNews(completion: @escaping (([News]) -> Void))
}

class NewsManager: NewsManagerProtocol {

    func fetchNews(completion: @escaping (([News]) -> Void)) {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-08&sortBy=publishedAt&apiKey=07d779f0a950464e8350257a68411772"
        NetworkManager.shared.get(url: url) { (result: Result<NewsResponse, Error>) in
            switch result {
            case .success(let response):
                completion(response.newsList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
