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
        let viewModel = HomeViewModelImpl()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        let homeController = HomeViewController(viewModel: viewModel, layout: layout)
        let nav = UINavigationController(rootViewController: homeController)
        return nav
    }
    
}
