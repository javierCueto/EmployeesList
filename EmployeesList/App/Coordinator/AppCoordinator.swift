//
//  AppCoordinator.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let factory = HomeFactoryImpl()
        let controller = factory.makeHome()
        navigationController.setViewControllers([controller], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
