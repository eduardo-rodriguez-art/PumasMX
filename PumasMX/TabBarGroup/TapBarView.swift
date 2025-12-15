//
//  TapBarView.swift
//  PumasMX
//
//  Created by José Eduardo Rodríguez Reyes on 15/12/25.
//
import UIKit

protocol TabBarViewProtocol: AnyObject {
    
}

class TapBarView: UITabBarController, TabBarViewProtocol {
    var presenter: TabBarPresenterProtocol?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidLoad()
    }
}
