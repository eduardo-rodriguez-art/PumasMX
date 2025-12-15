//
//  SplashScreenRouter.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import UIKit

protocol SplashScreenRouterProtocol: AnyObject {
    func navigateToMain()
}

class SplashScreenRouter: SplashScreenRouterProtocol {
    
    weak var view: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = SplashScreenView()
        let presenter = SplashScreenPresenter()
        _ = SplashScreenInteractor()
        let router = SplashScreenRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.view = view
        
        return view
    }
    
    func navigateToMain() {
        let tabBarRouter = TapBarRouter.createModule()
        
        guard let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive }),
        let window = windowScene.windows.first else { return }
        
        UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: {
            window.rootViewController = tabBarRouter
        })
        
    }
    
}
