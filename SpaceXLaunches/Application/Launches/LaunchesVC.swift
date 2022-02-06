//
//  LaunchesVC.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

class LaunchesVC: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Section, LaunchListQuery.Data.Launch>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, LaunchListQuery.Data.Launch>

    private let viewModel = LaunchesVM()
    private lazy var dataSource = makeDataSource()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSearchController()
        bind()
        viewModel.fetch(pagination: false)
    }
    
    private func configureView() {
        navigationItem.title = "SpaceX Launches"
        tableView.backgroundColor = UIColor(white: 30.0/255.0, alpha: 1)
        tableView.registerWithNib(cellClass: LaunchCell.self)
        tableView.separatorStyle = .none
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

//MARK:- UITableViewDiffableDataSource Operations
private extension LaunchesVC {
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(tableView: tableView,
                                    cellProvider: { (tableView, indexPath, launch) -> UITableViewCell? in
                                        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchCell.reuseIdentifier, for: indexPath) as? LaunchCell
                                        cell?.launch = launch
                                        return cell
                                    })
        return dataSource
    }
}

//MARK:- UISearchResultsUpdating Operation
extension LaunchesVC: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}

//MARK:- Listen ScrollView For Pagination
extension LaunchesVC {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height - scrollView.contentSize.height {
            guard !viewModel.isPaginating else { return }
            viewModel.fetch(pagination: true)
        }
    }
}

//MARK:- Binding Operations
private extension LaunchesVC {
    func bind() {
        bindLaunches()
        bindError()
    }
    
    func bindLaunches() {
        viewModel.launches
            .subscribe(onNext: { [weak self] launches in
                var snapshot = Snapshot()
                snapshot.appendSections([.main])
                snapshot.appendItems(launches)
                self?.dataSource.apply(snapshot, animatingDifferences: false)
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindError() {
        viewModel.errorListener
            .compactMap{$0}
            .subscribe(onNext: { [weak self] error in
                self?.showPopup(withTitle: "Network Error", message: error.localizedDescription, handler: { exit(0) })
            })
            .disposed(by: viewModel.disposeBag)
    }
}

enum Section {
    case main
}

extension LaunchListQuery.Data.Launch: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: LaunchListQuery.Data.Launch, rhs: LaunchListQuery.Data.Launch) -> Bool {
        return lhs.id == rhs.id
    }
}
