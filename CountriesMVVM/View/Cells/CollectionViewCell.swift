//
//  CollectionViewCell.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    let label = UILabel()
    let capitalLabel = UILabel()
    let populationLabel = UILabel()
    
    weak var viewModel: CollectionViewCellProcotol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            label.text = viewModel.countryName
            capitalLabel.text = viewModel.capital
            populationLabel.text = String(viewModel.population)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        constraint()
    }
    
    func setup() {
        [label, capitalLabel, populationLabel].forEach { contentView.addSubview($0) }
        [label, capitalLabel, populationLabel].forEach { $0.adjustsFontSizeToFitWidth = true }
        [label, capitalLabel, populationLabel].forEach { $0.textColor = .white }
        [label, capitalLabel, populationLabel].forEach { $0.textAlignment = .center }
        [label, capitalLabel, populationLabel].forEach { $0.numberOfLines = 0 }

        contentView.enableCornerRadius(radius: 20)
        contentView.layer.borderColor = UIColor.orange.cgColor
        contentView.layer.borderWidth = 2
    
        label.textAlignment = .center
        capitalLabel.textAlignment = .center
        populationLabel.textAlignment = .center
    }
    
    func constraint() {
        label.anchor(top: contentView.safeAreaLayoutGuide.topAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: capitalLabel.topAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        capitalLabel.anchor(top: label.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: populationLabel.topAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        populationLabel.anchor(top: capitalLabel.bottomAnchor, leading: contentView.safeAreaLayoutGuide.leadingAnchor, bottom: contentView.safeAreaLayoutGuide.bottomAnchor, trailing: contentView.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
