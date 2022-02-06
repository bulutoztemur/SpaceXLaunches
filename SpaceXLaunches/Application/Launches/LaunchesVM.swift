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
    private let offsetConstant = 10
    private var offsetMultiplier = 0
    let disposeBag = DisposeBag()
    let launches = BehaviorRelay<[LaunchListQuery.Data.Launch]>(value: [])
    let errorListener = BehaviorRelay<Error?>(value: nil)
    var isPaginating = false
    var hasMore = true
    
    func fetch(pagination: Bool = false) {
        guard hasMore else { return }
        if pagination {
            isPaginating = true
        }
        
        Network.shared.fetch(query: LaunchListQuery(offset: offsetMultiplier * offsetConstant)) { [weak self] response in
            guard let self = self else { return }
            let response = response.launches?.compactMap{$0} ?? []
            self.launches.accept(self.launches.value + response)
            self.offsetMultiplier += 1
            if pagination { self.isPaginating = false }
            if response.count < 10 { self.hasMore = false }
        } errorHandler: { error in
            self.errorListener.accept(error)
        }
    }
}
