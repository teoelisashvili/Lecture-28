//
//  NewsListViewModel.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit

protocol NewsListViewModelProtocol: AnyObject {
    func fetchNewses(completion: @escaping (([NewsViewModel]) -> Void))
    
    init(with newsManager: NewsManagerProtocol)
}

final class NewsListViewModel: NewsListViewModelProtocol {
    
    private var newsManager: NewsManagerProtocol
    
    init(with newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNewses(completion: @escaping (([NewsViewModel]) -> Void)) {
        newsManager.fetchNews { newsList in
            completion(newsList.map { NewsViewModel(news: $0) })
        }
    }
}

