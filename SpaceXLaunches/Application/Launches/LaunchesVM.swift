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
    let filteredLaunches = BehaviorRelay<[LaunchListQuery.Data.Launch]>(value: [])
    let errorListener = BehaviorRelay<Error?>(value: nil)
    let currentIndex = BehaviorRelay<Int>(value: 0)
    let isPaginating = BehaviorRelay<Bool>(value: false)
    let searchText = BehaviorRelay<String?>(value: nil)
    var hasMore = true
    
    init() {
        bind()
    }
    
    func fetch(pagination: Bool = false) {
        guard hasMore, !isPaginating.value else { return }
        if pagination {
            isPaginating.accept(true)
        }
        
        Network.shared.fetch(query: LaunchListQuery(offset: offsetMultiplier * offsetConstant)) { [weak self] response in
            guard let self = self else { return }
            let response = response.launches?.compactMap{$0} ?? []
            self.launches.accept(self.launches.value + response)
            self.offsetMultiplier += 1
            if pagination { self.isPaginating.accept(false) }
            if response.count < 10 { self.hasMore = false }
        } errorHandler: { error in
            self.errorListener.accept(error)
        }
    }
    
    func bind() {
        Observable.combineLatest(searchText, launches)
            .subscribe(onNext: { [weak self] text, launches in
                guard let self = self else { return }
                self.filteredLaunches.accept(launches.filter { ($0.missionName?.lowercased().hasPrefix(text?.lowercased() ?? "") ?? false)})
            })
            .disposed(by: disposeBag)
    }
    
}
