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
    let stackView = UIStackView()
    let upButton = GradientButton(colors: [UIColor.systemYellow.cgColor, UIColor.systemRed.cgColor])
    let downButton = GradientButton(colors: [UIColor.cyan.cgColor, UIColor.systemIndigo.cgColor])
    
    var nameForLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
        setup()
        constraint()
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.changedValue.value = nameForLabel
        self.nameForLabel = viewModel?.currentArray[0].region ?? "FKY"
        toplabel.text = nameForLabel
    }
    
    func setup() {
        [toplabel, stackView, collectionView].forEach { view.addSubview($0) }
        [upButton, downButton].forEach { stackView.addArrangedSubview($0) }
        [upButton, downButton].forEach { $0.enableCornerRadius(radius: 10) }
        
        upButton.addTarget(self, action: #selector(upTapped), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downTapped), for: .touchUpInside)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        upButton.setTitle("Population", for: .normal)
        downButton.setTitle("Name", for: .normal)
        
        toplabel.textColor = .systemRed
        toplabel.textAlignment = .center
        toplabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        backImage.kf.setImage(with: URL(string: viewModel?.imageName ?? ""))
        backImage.contentMode = .scaleAspectFill
        backImage.alpha = 0.4
        collectionView.backgroundView = backImage
    }
    
    func constraint() {
        toplabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: stackView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 10, bottom: 10, right: 10))
        stackView.anchor(top: toplabel.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: collectionView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        collectionView.anchor(top: stackView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    
    func register() {
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    func setLayout() {
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 180, height: 200)
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @objc func upTapped() {
        guard var viewModel = viewModel else { return }
        viewModel.currentArray = viewModel.upButtonTapped()
        collectionView.reloadData()
    }
    
    @objc func downTapped() {
        guard var viewModel = viewModel else { return }
        viewModel.currentArray = viewModel.downButtonTapped()
        collectionView.reloadData()
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
            [cell.label, cell.capitalLabel, cell.populationLabel].forEach { $0.textColor = UIColor.systemGreen }
            cell.label.font = UIFont(name: "ZapfDingbatsITC", size: 26)
            cell.capitalLabel.font = UIFont(name: "ZapfDingbatsITC", size: 21)
            cell.populationLabel.font = UIFont(name: "ZapfDingbatsITC", size: 19)

        } else if self.nameForLabel == "Americas" {
            [cell.label, cell.capitalLabel, cell.populationLabel].forEach { $0.textColor = UIColor.white }
            cell.label.font = UIFont(name: "Courier-Bold", size: 26)
            cell.capitalLabel.font = UIFont(name: "Courier-Bold", size: 21)
            cell.populationLabel.font = UIFont(name: "Courier-Bold", size: 19)

        } else if self.nameForLabel == "Asia" {
            [cell.label, cell.capitalLabel, cell.populationLabel].forEach { $0.textColor = UIColor.systemYellow }
            cell.label.font = UIFont(name: "GujaratiSangamMN", size: 26)
            cell.capitalLabel.font = UIFont(name: "GujaratiSangamMN", size: 21)
            cell.populationLabel.font = UIFont(name: "GujaratiSangamMN", size: 19)

        } else if self.nameForLabel == "Europe" {
            [cell.label, cell.capitalLabel, cell.populationLabel].forEach { $0.textColor = UIColor.systemPink }
            cell.label.font = UIFont(name: "Baskerville-Bold", size: 26)
            cell.capitalLabel.font = UIFont(name: "Baskerville-Bold", size: 21)
            cell.populationLabel.font = UIFont(name: "Baskerville-Bold", size: 19)

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
