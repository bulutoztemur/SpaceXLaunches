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
        bind()
        viewModel.fetch(pagination: false)
    }
    
}

//MARK:- View Configuration Operations
private extension LaunchesVC {
    func configureView() {
        navigationItem.title = "SpaceX Launches"
        configureTableView()
        configureSearchController()
    }
    
    func configureTableView() {
        tableView.backgroundColor = UIColor(white: 30.0/255.0, alpha: 1)
        tableView.registerWithNib(cellClass: LaunchCell.self)
        tableView.separatorStyle = .none
    }
    
    func createSpinnerTableViewFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    func configureSearchController() {
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
                                    cellProvider: { [weak self] (tableView, indexPath, launch) -> UITableViewCell? in
                                        self?.viewModel.currentIndex.accept(indexPath.row)
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

//MARK:- Binding Operations
private extension LaunchesVC {
    func bind() {
        bindLaunches()
        bindError()
        bindIsPaginating()
        bindCurrentIndex()
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
    
    func bindIsPaginating() {
        viewModel.isPaginating
            .subscribe(onNext: { [weak self] isPaginating in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = isPaginating ? self.createSpinnerTableViewFooter() : nil
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindCurrentIndex() {
        viewModel.currentIndex
            .subscribe(onNext: { [weak self] currentIndex in
                if (self?.viewModel.launches.value.count ?? 0) - currentIndex < 3 {
                    self?.viewModel.fetch(pagination: true)
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
}

enum Section {
    case main
}

extension LaunchListQuery.Data.Launch: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(launchDateUtc)
        hasher.combine(missionName)
        hasher.combine(id)
    }

    public static func == (lhs: LaunchListQuery.Data.Launch, rhs: LaunchListQuery.Data.Launch) -> Bool {
        return lhs.launchDateUtc == rhs.launchDateUtc &&
            lhs.missionName == rhs.missionName &&
            lhs.id == rhs.id
    }
}
