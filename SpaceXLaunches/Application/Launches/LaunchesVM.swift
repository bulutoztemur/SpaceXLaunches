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
    var isPaginating = false
    
    func fetch(_ pagination: Bool = false, errorHandler: @escaping (Error) -> ()) {
        if pagination {
            isPaginating = true
        }
        Network.shared.apollo.fetch(query: LaunchListQuery(offset: offsetMultiplier * numOfLaunchesForEachFetch)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let graphQLResult):
                //print("Success! Result: \(graphQLResult)")
                let result = graphQLResult.data?.launches?.compactMap({ $0 })
                self.launches.accept(self.launches.value + (result ?? []))
                self.offsetMultiplier += 1
                if pagination { self.isPaginating = false }
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
