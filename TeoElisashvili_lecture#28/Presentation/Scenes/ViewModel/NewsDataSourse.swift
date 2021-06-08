//
//  NewsDataSourse.swift
//  TeoElisashvili_lecture#28
//
//  Created by Teo Elisashvili on 08.06.21.
//

import UIKit

class NewsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var viewModel: NewsListViewModelProtocol!
    private var newsViewModels = [NewsViewModel]()
    
    init(with tableView: UITableView, viewModel: NewsListViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchNewses { viewModels in
            self.newsViewModels.append(contentsOf: viewModels)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(NewsCell.self, for: indexPath)
        cell.configure(with: newsViewModels[indexPath.row])
        return cell
    }
}

