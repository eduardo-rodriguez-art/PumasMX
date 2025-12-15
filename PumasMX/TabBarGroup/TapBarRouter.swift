//
//  TapBarRouter.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import UIKit

protocol TapBarRouterProtocol: AnyObject {
    func setupTabs()
}

class TapBarRouter: TapBarRouterProtocol {
    
    weak var view: TapBarView?
    
    static func createModule() -> UITabBarController {
        let view = TapBarView()
        let presenter = TabBarPresenter()
        let router = TapBarRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        
        return view
    }
    
    func setupTabs() {
        
        let news = NewsViewController()
        let teams = TeamsInfoViewController()
        let shop = ShopViewController()
        let settings = SettingsViewController()
        
        news.tabBarItem = UITabBarItem(
            title: "Noticias",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        
        teams.tabBarItem = UITabBarItem(
            title: "Equipos",
            image: UIImage(systemName: "figure.indoor.soccer"),
            selectedImage: UIImage(systemName: "figure.indoor.soccer")
        )
        
        shop.tabBarItem = UITabBarItem(
            title: "Shop",
            image: UIImage(systemName: "bag.circle"),
            selectedImage: UIImage(systemName: "bag.circle.fill")
        )
        
        settings.tabBarItem = UITabBarItem(
            title: "Ajustes",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear.fill")
        )
        
        view?.viewControllers = [
            UINavigationController(rootViewController: news),
            UINavigationController(rootViewController: teams),
            UINavigationController(rootViewController: shop),
            UINavigationController(rootViewController: settings)
        ]
        
    }
    
}
