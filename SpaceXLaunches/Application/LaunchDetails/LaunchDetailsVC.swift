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
    
    @IBOutlet weak var missionPatchImageView: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    
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
private extension LaunchDetailsVC {
    func bind() {
        bindError()
        bindImageInputSources()
        bindYoutubeVideoId()
        bindMissionPatchSmall()
        bindMissionName()
    }
    
    func bindImageInputSources() {
        viewModel.imageInputSources
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] imageInputSources in
                self?.imageSlideShow.setImageInputs(imageInputSources)
                self?.imageSlideShow.isHidden = false
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindYoutubeVideoId() {
        viewModel.youtubeVideoId
            .filter { !($0?.isEmpty ?? true) }
            .subscribe(onNext: { [weak self] youtubeVideoId in
                self?.ytPlayerView.load(withVideoId: youtubeVideoId!)
                self?.ytPlayerView.isHidden = false
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindMissionPatchSmall() {
        viewModel.missionPatchUrl
            .subscribe(onNext: { [weak self] missionPatchUrl in
                let placeholder = UIImage(named: "SpaceX")
                if let missionPatch = missionPatchUrl {
                  self?.missionPatchImageView.sd_setImage(with: URL(string: missionPatch)!, placeholderImage: placeholder)
                } else {
                  self?.missionPatchImageView.image = placeholder
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindMissionName() {
        viewModel.missionName
            .asDriver()
            .filter { $0 != nil }
            .drive(missionNameLabel.rx.text)
            .disposed(by: viewModel.disposeBag)
    }
    
    func bindError() {
        viewModel.errorListener
            .compactMap{$0}
            .subscribe(onNext: { [weak self] error in
                guard let self = self else { return }
                self.showPopup(withTitle: "Network Error",
                                message: error.localizedDescription,
                                OkHandler: { self.navigationController?.popViewController(animated: true) })
            })
            .disposed(by: viewModel.disposeBag)
    }
}
