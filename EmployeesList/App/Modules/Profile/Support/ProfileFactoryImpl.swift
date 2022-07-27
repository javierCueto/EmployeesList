//
//  ProfileFactoryImpl.swift
//  EmployeesList
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol ProfileFactory {
   func make() -> UIViewController
}

struct ProfileFactoryImpl: ProfileFactory {
    
    func make() -> UIViewController {
//        let api = ApiClient()
//        let employeesRepository = EmployeesRepositoryImpl(apiClient: api)
//        let useCase = LoadEmployeesUseCaseImpl(employeesRepository: employeesRepository)
//        let viewModel = HomeViewModelImpl(loadEmployeesUseCase: useCase)
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
       return ProfileViewController()
    }
    
}

