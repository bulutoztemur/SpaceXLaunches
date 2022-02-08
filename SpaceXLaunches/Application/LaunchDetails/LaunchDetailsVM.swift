//
//  LaunchDetailsVM.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import RxSwift
import RxCocoa
import Foundation
import ImageSlideshow

final class LaunchDetailsVM {
    let disposeBag = DisposeBag()
    let launch = BehaviorRelay<LaunchDetailQuery.Data.Launch?>(value: nil)
    let youtubeVideoId = BehaviorRelay<String?>(value: nil)
    let imageInputSources = BehaviorRelay<[InputSource]>(value: [])
    let missionPatchUrl = BehaviorRelay<String?>(value: nil)
    let missionName = BehaviorRelay<String?>(value: nil)
    let infoPairs = BehaviorRelay<[KeyValuePair]>(value: [])
    let linkPairs = BehaviorRelay<[KeyValuePair]>(value: [])
    let details = BehaviorRelay<String?>(value: nil)
    let errorListener = BehaviorRelay<Error?>(value: nil)
    
    init() {
        bind()
    }
    
    func fetchDetails(id: String) {
        Network.shared.fetch(query: LaunchDetailQuery(myId: id)) { [weak self] response in
            guard let self = self else { return }
            self.launch.accept(response.launch)
        } errorHandler: { error in
            self.errorListener.accept(error)
        }
    }
    
    private func createInfoPairs(_ launch: LaunchDetailQuery.Data.Launch) -> [KeyValuePair] {
        return [KeyValuePair(key: "Result", value: (launch.launchSuccess ?? false) ? "Successful" : "Unsuccessful"),
                KeyValuePair(key: "Date", value: DateUtil.getStringFromDateUnix(dateUnix: Double(launch.launchDateUnix ?? "0")!, dateFormat: .ddMMMMyyyyWithSpace))]
    }
    
    private func createLinkPairs(_ launch: LaunchDetailQuery.Data.Launch) -> [KeyValuePair] {
        guard let links = launch.links else { return [] }
        var pairList: [KeyValuePair] = []
        if let wikiLink = links.wikipedia {
            pairList.append(KeyValuePair(key: "Wikipedia", value: wikiLink))
        }
        if let articleLink = links.articleLink {
            pairList.append(KeyValuePair(key: "Article", value: articleLink))
        }
        return pairList
    }
}

private extension LaunchDetailsVM {
    func bind() {
        bindLaunch()
    }
    
    func bindLaunch() {
        launch
            .flatMap { $0.map(Observable.just) ?? Observable.empty() }
            .subscribe(onNext: { [weak self] launch in
                guard let self = self else { return }
                let videoId = String(launch.links?.videoLink?.split(separator: "/").last ?? "")
                self.youtubeVideoId.accept(videoId)
                let inputs = launch.links?.flickrImages?.compactMap({ AlamofireSource(urlString: $0!) })
                self.imageInputSources.accept(inputs ?? [])
                self.missionPatchUrl.accept(launch.links?.missionPatchSmall)
                self.missionName.accept(launch.missionName)
                self.infoPairs.accept(self.createInfoPairs(launch))
                self.linkPairs.accept(self.createLinkPairs(launch))
                self.details.accept(launch.details)
            })
            .disposed(by: disposeBag)
    }
}
