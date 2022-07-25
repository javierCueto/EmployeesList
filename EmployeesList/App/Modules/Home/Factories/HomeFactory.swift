//
//  HomeFactory.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

protocol HomeFactory {
   func makeHome() -> UIViewController
}

struct HomeFactoryImpl: HomeFactory {
    
    func makeHome() -> UIViewController {
        let homeController = HomeViewController(collectionViewLayout: UICollectionViewLayout())
        let nav = UINavigationController(rootViewController: homeController)
        return nav
    }
    
}
