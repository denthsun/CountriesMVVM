//
//  CountryViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import UIKit

class CountryViewController: UIViewController {
    
    var viewModel: CountryViewControllerViewModelProtocol?
    
    let stackView = UIStackView()
    
    var nameLabel = UILabel()
    var capitalLabel = UILabel()
    var populationLabel = UILabel()
    var subregionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        constraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let viewModel = viewModel else { return }
        nameLabel.text = "Country: \(viewModel.name)"
        capitalLabel.text = "Capital City: \(viewModel.capital)"
        populationLabel.text = "Population: \(String(viewModel.population))"
        subregionLabel.text = "Locates in \(viewModel.subregion)"
    }
    
    func setup() {
        view.addSubview(stackView)
        [nameLabel, capitalLabel, populationLabel, subregionLabel].forEach { stackView.addArrangedSubview($0) }
        [nameLabel, capitalLabel, populationLabel, subregionLabel].forEach { $0.textColor = .systemRed }
        [nameLabel, capitalLabel, populationLabel, subregionLabel].forEach { $0.adjustsFontSizeToFitWidth = true }
        [nameLabel, capitalLabel, populationLabel, subregionLabel].forEach { $0.font = UIFont.boldSystemFont(ofSize: 20) }
        [nameLabel, capitalLabel, populationLabel, subregionLabel].forEach { $0.textAlignment = .center }
        
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        
    }
    
    func constraint() {
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
    }
    

}
