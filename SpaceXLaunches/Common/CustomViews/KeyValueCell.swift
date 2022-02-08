//
//  KeyValueCell.swift
//  SpaceXLaunches
//
//  Created by alaattinbulut on 8.02.2022.
//

import UIKit

class KeyValueCell: UITableViewCell {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()
    
    private let keyLabel: UILabel = {
        let keyLabel = UILabel()
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        keyLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        keyLabel.numberOfLines = 0
        return keyLabel
    }()
    
    private let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        valueLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        valueLabel.numberOfLines = 0
        return valueLabel
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        addContentView()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(pairInfo: KeyValuePair, isLink: Bool) {
        keyLabel.text = pairInfo.key
        valueLabel.text = pairInfo.value
        valueLabel.isHidden = isLink
        iconView.isHidden = !isLink
    }
    
    private func configureCell() {
        backgroundColor = .clear
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func addContentView() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(keyLabel)
        stackView.addArrangedSubview(rightStackView)
        rightStackView.addArrangedSubview(valueLabel)
        rightStackView.addArrangedSubview(iconView)
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            iconView.heightAnchor.constraint(equalToConstant: 20),
            iconView.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
