//
//  SplashScreenView.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import UIKit

protocol SplashScreenViewProtocol: AnyObject {
    func showLogo()
}

class SplashScreenView: UIViewController, SplashScreenViewProtocol {
    
    var presenter: SplashScreenPresenterProtocol?
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "PumasMXLogoOficial"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Club Universidad Nacional A.C."
//        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.font = UIFont(name: "Montserrat-Bold", size: 35)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    private func setupUI() {
        view.backgroundColor = .init(red: 212/255, green: 175/255, blue: 55/255, alpha: 1)
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLabel.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func showLogo() {
        UIView.animate(withDuration: 0.7) {
            self.logoImageView.alpha = 1
        }
    }
}
