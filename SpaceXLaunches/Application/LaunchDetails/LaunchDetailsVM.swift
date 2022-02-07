//
//  LaunchDetailsVM.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import RxSwift
import RxCocoa
import Foundation

final class LaunchDetailsVM {
    let disposeBag = DisposeBag()
    let launch = BehaviorRelay<LaunchDetailQuery.Data.Launch?>(value: nil)
    let errorListener = BehaviorRelay<Error?>(value: nil)

    func fetchDetails(id: String) {
        Network.shared.fetch(query: LaunchDetailQuery(myId: id)) { [weak self] response in
            guard let self = self else { return }
            self.launch.accept(response.launch)
        } errorHandler: { error in
            self.errorListener.accept(error)
        }

    }
    
}
