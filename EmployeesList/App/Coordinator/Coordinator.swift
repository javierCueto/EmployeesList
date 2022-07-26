//
//  Coordinator.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}
