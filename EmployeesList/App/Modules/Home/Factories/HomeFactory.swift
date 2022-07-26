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
        let api = ApiClient()
        let employeesRepository = EmployeesRepositoryImpl(apiClient: api)
        let useCase = LoadEmployeesUseCaseImpl(employeesRepository: employeesRepository)
        let viewModel = HomeViewModelImpl(loadEmployeesUseCase: useCase)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        return HomeViewController(viewModel: viewModel, layout: layout)
    }
    
}
