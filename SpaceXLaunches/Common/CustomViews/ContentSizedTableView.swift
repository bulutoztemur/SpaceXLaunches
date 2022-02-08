//
//  ContentSizedTableView.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 9.02.2022.
//

import UIKit

class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
