//
//  AppCoordinator.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didSelectProfile()
}

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let homeFactory = HomeFactoryImpl()
        let controller = homeFactory.makeHome(delegate: self)
        navigationController.setViewControllers([controller], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

extension AppCoordinator: HomeViewControllerDelegate {
    func didSelectProfile() {
        let factory = ProfileFactoryImpl()
        let nav = UINavigationController(rootViewController: factory.make())
        navigationController.present(nav, animated: true)
    }
}


