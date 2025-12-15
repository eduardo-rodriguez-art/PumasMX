//
//  TapBarPresenter.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    func viewDidLoad()
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    var router: TapBarRouterProtocol?
    
    func viewDidLoad() {
        router?.setupTabs()
    }
}
