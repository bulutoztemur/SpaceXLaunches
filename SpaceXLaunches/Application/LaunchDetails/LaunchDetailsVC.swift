//
//  LaunchDetailsVC.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit
import RxSwift
import RxCocoa
import youtube_ios_player_helper
import ImageSlideshow

class LaunchDetailsVC: UIViewController {
    private let viewModel = LaunchDetailsVM()
    
    @IBOutlet weak var ytPlayerView: YTPlayerView!
    @IBOutlet weak var imageSlideShow: ImageSlideshow! {
        didSet {
            let labelPage = LabelPageIndicator()
            labelPage.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            labelPage.attributedText = NSAttributedString(string: labelPage.text ?? "",
                                                          attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])
            labelPage.textColor = .white
            imageSlideShow.pageIndicator = labelPage
            imageSlideShow.pageIndicatorPosition = PageIndicatorPosition(horizontal: .right(padding: 10), vertical: .customBottom(padding: 10))
            imageSlideShow.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImage)))
        }
    }
    
    private let launchId: String

    init(id: String) {
        self.launchId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetchDetails(id: launchId)
    }

    @objc func didTapImage() {
        imageSlideShow.presentFullScreenController(from: self)
    }
}

//MARK:- Binding Operations
extension LaunchDetailsVC {
    func bind() {
        viewModel.launch
            .flatMap { $0.map(Observable.just) ?? Observable.empty() }
            .subscribe(onNext: { [weak self] launch in
                if let links = launch.links {
                    if let youtubeLink = links.videoLink {
                        let splitted = youtubeLink.split(separator: "/")
                        let videoId = String(splitted[splitted.count - 1])
                        self?.ytPlayerView.load(withVideoId: videoId)
                    } else {
                        self?.ytPlayerView.isHidden = true
                    }
                    
                    if let inputs = links.flickrImages?.compactMap({ AlamofireSource(urlString: $0!) }), !inputs.isEmpty {
                        self?.imageSlideShow.setImageInputs(inputs)
                    } else {
                        self?.imageSlideShow.isHidden = true
                    }
                    
                }
            })
            .disposed(by: viewModel.disposeBag)
        }
}
