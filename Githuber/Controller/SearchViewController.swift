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
        searchBar.placeholder = R.string.localizable.search_bar_placeholder()
        searchBar.rx.searchButtonClicked.bind { [unowned self] in
            self.viewModel.search()
        }.disposed(by: disposeBag)
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.hideFooterView()
        tableView.keyboardDismissMode = .interactive
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: RepositoryItemTableViewCell.self)
        tableView.rx.itemSelected.bind { [unowned self] in
            tableView.deselectRow(at: $0, animated: true)
            self.viewModel.pick(at: $0.row)
        }.disposed(by: disposeBag)
        return tableView
    }()
    
    private lazy var dataSource = RepositoryItemTableViewCell.tableViewSingleSectionDataSource()
    
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
