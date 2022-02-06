//
//  LaunchesVM.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import Foundation

class LaunchesVM {
    private let numOfLaunchesForEachFetch = 10
    private var offsetMultiplier = 0
    
    func fetch() {
        Network.shared.apollo.fetch(query: LaunchListQuery(offset: offsetMultiplier * numOfLaunchesForEachFetch)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                self.offsetMultiplier += 1
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
