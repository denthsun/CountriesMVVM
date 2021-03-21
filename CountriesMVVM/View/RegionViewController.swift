//
//  RegionViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import UIKit
import Kingfisher

class RegionViewController: UIViewController {
    
    var viewModel: RegionViewControllerViewModelProtocol? 
    
    let toplabel = UILabel()
    
    let collectionView = UICollectionView(frame: .init(), collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let backImage = UIImageView()
    var nameForLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
        setup()
        constraint()
        view.backgroundColor = .systemGreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.changedValue.value = nameForLabel
        self.nameForLabel = viewModel?.currentArray[0].region ?? "FKY"
        toplabel.text = nameForLabel
    }

    
    func setup() {
        [toplabel, collectionView].forEach { view.addSubview($0) }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        backImage.contentMode = .scaleAspectFill
        
        toplabel.textColor = .systemRed
        toplabel.textAlignment = .center
        toplabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        backImage.kf.setImage(with: URL(string: viewModel?.imageName ?? ""))
        backImage.alpha = 0.4
        collectionView.backgroundView = backImage
    }
    
    func constraint() {
        toplabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: collectionView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 10, right: 10))
        collectionView.anchor(top: toplabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    
    func register() {
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func setLayout() {
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 180, height: 200)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
}

extension RegionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfSections() ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell, let viewModel = viewModel else { return UICollectionViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        if self.nameForLabel == "Africa" {
            [cell.label, cell.capitalLabel].forEach { $0.textColor = UIColor.white }
        } else if self.nameForLabel == "Americas" {
            [cell.label, cell.capitalLabel].forEach { $0.textColor = UIColor.systemRed }
        } else if self.nameForLabel == "Asia" {
            [cell.label, cell.capitalLabel].forEach { $0.textColor = UIColor.systemYellow }
        } else if self.nameForLabel == "Europe" {
            [cell.label, cell.capitalLabel].forEach { $0.textColor = UIColor.systemPink }
    }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectItem(atIndexPath: indexPath)
        
        let countryVC = CountryViewController()
        navigationController?.pushViewController(countryVC, animated: true)
        countryVC.viewModel = viewModel.viewModelForSelectedItem()
    }
}
