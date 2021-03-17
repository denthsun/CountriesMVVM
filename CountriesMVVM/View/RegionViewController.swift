//
//  RegionViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import UIKit

class RegionViewController: UIViewController {
    
    var viewModel: RegionViewControllerViewModelProtocol? 
    
    let toplabel = UILabel()
    
    let collectionView = UICollectionView(frame: .init(), collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
   

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
        toplabel.text = viewModel?.currentArray[0].region

    }
    
    func setup() {
        [toplabel, collectionView].forEach { view.addSubview($0) }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .blue
        
        toplabel.textColor = .systemRed
        toplabel.textAlignment = .center
        toplabel.font = UIFont.boldSystemFont(ofSize: 30)
        
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
        layout.itemSize = .init(width: 150, height: 150)
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
