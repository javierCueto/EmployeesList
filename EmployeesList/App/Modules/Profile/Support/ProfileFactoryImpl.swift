//
//  ProfileFactoryImpl.swift
//  EmployeesList
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

protocol ProfileFactory {
   func make(with employee: Employee) -> UIViewController
}

struct ProfileFactoryImpl: ProfileFactory {
    
    func make(with employee: Employee) -> UIViewController {
//        let api = ApiClient()
//        let employeesRepository = EmployeesRepositoryImpl(apiClient: api)
//        let useCase = LoadEmployeesUseCaseImpl(employeesRepository: employeesRepository)
        let viewModel = ProfileViewModelImpl(employee: employee)
//        let layout = UICollectionViewFlowLayout()
        return ProfileViewController(viewModel: viewModel)
    }
    
}

