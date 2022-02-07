//
//  LaunchDetailsVC.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 6.02.2022.
//

import UIKit

class LaunchDetailsVC: UIViewController {
    private let viewModel = LaunchDetailsVM()
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
        viewModel.fetchDetails(id: launchId)
    }



}
