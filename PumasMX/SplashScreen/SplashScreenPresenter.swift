//
//  SplashScreenPresenter.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import Foundation

protocol SplashScreenPresenterProtocol: AnyObject {
    func viewDidAppear()
}

class SplashScreenPresenter: SplashScreenPresenterProtocol {
    
    weak var view: SplashScreenViewProtocol?
    var router: SplashScreenRouterProtocol?
    
    func viewDidAppear() {
        view?.showLogo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router?.navigateToMain()
        }
    }
    
    
}
