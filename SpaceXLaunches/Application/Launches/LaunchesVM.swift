//
//  LaunchesVM.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import Foundation
import RxSwift
import RxCocoa

class LaunchesVM {
    private let numOfLaunchesForEachFetch = 10
    private var offsetMultiplier = 0
    let disposeBag = DisposeBag()
    let launches = BehaviorRelay<[LaunchListQuery.Data.Launch]>(value: [])
    
    func fetch(errorHandler: @escaping (Error) -> ()) {
        Network.shared.apollo.fetch(query: LaunchListQuery(offset: offsetMultiplier * numOfLaunchesForEachFetch)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let graphQLResult):
                //print("Success! Result: \(graphQLResult)")
                let result = graphQLResult.data?.launches?.compactMap({ $0 })
                self.launches.accept(result ?? [])
                self.offsetMultiplier += 1
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
