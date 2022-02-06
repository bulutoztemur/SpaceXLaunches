//
//  LaunchesVC.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

class LaunchesVC: UITableViewController {

    typealias DataSource = UITableViewDiffableDataSource<Section, LaunchListQuery.Data.Launch>

    private let viewModel = LaunchesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch()

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
