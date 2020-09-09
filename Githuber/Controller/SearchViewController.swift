//
//  SearchViewController.swift
//  Githuber
//
//  Created by Meng Li on 2020/9/9.
//  Copyright © 2020 Meng Li. All rights reserved.
//

import RxSwift

final class SearchViewController: BaseViewController<SearchViewModel> {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: RepositoryItemTableViewCell.self)
        return tableView
    }()
    
    private lazy var dataSource = RepositoryItemTableViewCell.tableViewSingleSectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.observeKeyword()
    }
    
    override func subviews() -> [UIView] {
        return [
            searchBar,
            tableView
        ]
    }
    
    override func bind() -> [Disposable] {
        return [
            viewModel.title ~> rx.title,
            viewModel.keyword <~> searchBar.rx.value,
            viewModel.repositoryItemSection ~> tableView.rx.items(dataSource: dataSource)
        ]
    }
    
    override func createConstraints() {
        searchBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeArea.top)
        }
        
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom)
        }
    }
    
}
