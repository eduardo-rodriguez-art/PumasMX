//
//  AppNavigationController.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureGlobalItems()
    }
    
    private func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 184/255, green: 134/255, blue: 11/255, alpha: 1)
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 19, weight: .semibold)
        ]
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
        
        navigationBar.tintColor = UIColor(
            red: 212/255,
            green: 175/255,
            blue: 55/255,
            alpha: 1)
    }
    
    private func configureGlobalItems() {
        guard let topVC = topViewController else { return }
        
        // Logo centrado
        let logoImageView = UIImageView(image: UIImage(named: "PumasMXLogoOficial"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationBar.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 54),
            logoImageView.widthAnchor.constraint(equalToConstant: 540),
            logoImageView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor)
        ])
        
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person"),
            style: .plain,
            target: self,
            action: #selector(profileTapped)
        )
        
        let shoppingCart = UIBarButtonItem(
            image: UIImage(systemName: "cart.circle"),
            style: .plain,
            target: self,
            action: #selector(shoppingCart))
        
        topVC.navigationItem.leftBarButtonItem = profileButton
        topVC.navigationItem.rightBarButtonItem = shoppingCart
    }
    
    @objc private func profileTapped() {
        print("Login pressed")
        // Aquí normalmente notificarías a un Router o Coordinator
    }
    
    @objc private func shoppingCart() {
        print("Compras pressed")
        // Aquí normalmente notificarías a un Router o Coordinator
    }
}
