//
//  LaunchesVC.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

class LaunchesVC: UITableViewController {
    private enum Section {
        case main
    }
    
    private typealias DataSource = UITableViewDiffableDataSource<Section, LaunchListQuery.Data.Launch>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, LaunchListQuery.Data.Launch>
    
    private let viewModel = LaunchesVM()
    private lazy var dataSource = makeDataSource()
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
    }
    
}

//MARK:- View Configuration Operations
private extension LaunchesVC {
    func configureView() {
        configureNavigationBar()
        configureTableView()
        configureSearchController()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "SpaceX Launches"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
    }
    
    func configureTableView() {
        tableView.backgroundColor = UIColor(white: 30.0/255.0, alpha: 1)
        tableView.registerWithNib(cellClass: LaunchCell.self)
        tableView.separatorStyle = .none
    }
    
    func createSpinnerTableViewFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.color = .white
        spinner.transform = CGAffineTransform(scaleX: 3, y: 3)
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Mission Name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

//MARK:- UITableViewDiffableDataSource Operations
private extension LaunchesVC {
    private func makeDataSource() -> DataSource {
        return DataSource(tableView: tableView,
                          cellProvider: { [weak self] (tableView, indexPath, launch) -> UITableViewCell? in
                            self?.viewModel.currentIndex.accept(indexPath.row)
                            let cell = tableView.dequeueReusableCell(withIdentifier: LaunchCell.reuseIdentifier, for: indexPath) as? LaunchCell
                            cell?.launch = launch
                            return cell
                          })
    }
}

extension LaunchesVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let launchId = viewModel.filteredLaunches.value[indexPath.row].id else { return }
        let launchDetailVC = LaunchDetailsVC(id: launchId)
        navigationController?.pushViewController(launchDetailVC, animated: true)
    }
}

//MARK:- UISearchResultsUpdating Operation
extension LaunchesVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchText.accept(searchController.searchBar.text)
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
        viewModel.filteredLaunches
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
                self?.showPopup(withTitle: "Network Error",
                                message: error.localizedDescription)
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindIsPaginating() {
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = isLoading ? self.createSpinnerTableViewFooter() : nil
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindCurrentIndex() {
        viewModel.currentIndex
            .subscribe(onNext: { [weak self] currentIndex in
                guard let self = self else { return }
                if self.viewModel.filteredLaunches.value.count - currentIndex < 3 {
                    self.viewModel.fetch()
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
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
