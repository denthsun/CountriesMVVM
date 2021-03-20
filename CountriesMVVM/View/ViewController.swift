//
//  ViewController.swift
//  CountriesMVVM
//
//  Created by Denis Velikanov on 17.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let dataFetcher = CountriesDataFetcher()
    
    let viewModel = ViewControllerViewModel()
    
    let europeButton = GradientButton(colors: [UIColor.systemRed.cgColor, UIColor.systemOrange.cgColor, UIColor.systemBlue.cgColor])
    let americaButton = GradientButton(colors: [UIColor.white.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor])
    let asiaButton = GradientButton(colors: [UIColor.red.cgColor, UIColor.systemRed.cgColor])
    let africaButton = GradientButton(colors: [UIColor.green.cgColor, UIColor.systemYellow.cgColor])
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requests()
        setup()
        constraint()
    }
    
    
    func setup() {
        view.addSubview(stackView)
        
        [europeButton, americaButton, asiaButton, africaButton].forEach { stackView.addArrangedSubview($0) }
        [europeButton, americaButton, asiaButton, africaButton].forEach { $0.backgroundColor = .systemRed }
        [europeButton, americaButton, asiaButton, africaButton, stackView].forEach { $0.enableCornerRadius(radius: 25) }
        
        europeButton.setTitle("Europe", for: .normal)
        americaButton.setTitle("Americas", for: .normal)
        asiaButton.setTitle("Asia", for: .normal)
        africaButton.setTitle("Africa", for: .normal)
        
        europeButton.addTarget(self, action: #selector(europeTapped), for: .touchUpInside)
        americaButton.addTarget(self, action: #selector(americaTapped), for: .touchUpInside)
        asiaButton.addTarget(self, action: #selector(asiaTapped), for: .touchUpInside)
        africaButton.addTarget(self, action: #selector(africaTapped), for: .touchUpInside)
        
        europeButton.setTitleColor(UIColor.purple, for: .normal)
        americaButton.setTitleColor(UIColor.black, for: .normal)
        asiaButton.setTitleColor(UIColor.systemYellow, for: .normal)
        africaButton.setTitleColor(UIColor.purple, for: .normal)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        
    }
    
    func constraint() {
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 2, right: 20))
    }
    
    func requests() {
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async { [weak self] in
            self?.dataFetcher.africaRequest { [weak self] (africa) in
                self?.viewModel.africaArray = africa
                print(africa as Any)
            }
            self?.dataFetcher.asiaRequest { [weak self] (asia) in
                self?.viewModel.asiaArray = asia
            }
            self?.dataFetcher.americaRequest { [weak self] (america) in
                self?.viewModel.americaArray = america
            }
            self?.dataFetcher.europeRequest { [weak self] (europe) in
                self?.viewModel.europeArray = europe
            }
        }
    }
    
@objc func europeTapped() {
    let vc = RegionViewController()
    navigationController?.pushViewController(vc, animated: true)
    vc.viewModel = viewModel.viewModelEurope()
}

@objc func americaTapped() {
    let vc = RegionViewController()
    navigationController?.pushViewController(vc, animated: true)
    vc.viewModel = viewModel.viewModelAmerica()
}

@objc func asiaTapped() {
    let vc = RegionViewController()
    navigationController?.pushViewController(vc, animated: true)
    vc.viewModel = viewModel.viewModelAsia()
}

@objc func africaTapped() {
    let vc = RegionViewController()
    navigationController?.pushViewController(vc, animated: true)
    vc.viewModel = viewModel.viewModelAfrica()

}

}

