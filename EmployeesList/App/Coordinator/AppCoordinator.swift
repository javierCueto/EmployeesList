//
//  AppCoordinator.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let factory = HomeFactoryImpl()
        let controller = factory.makeHome()
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
}
