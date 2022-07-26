//
//  LoadEmployeesUseCase.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

protocol LoadEmployeesUseCase {
    func execute(completion: @escaping (Result<[Employee],Error>) -> Void)
}

struct LoadEmployeesUseCaseImpl: LoadEmployeesUseCase  {
    
    private var employeesRepository: EmployeesRepository
    
    init(employeesRepository: EmployeesRepository) {
        self.employeesRepository = employeesRepository
    }
    
    func execute(completion: @escaping (Result<[Employee], Error>) -> Void) {
        employeesRepository.fetchEmployee(completion: completion)
    }
    
}

protocol EmployeesRepository {
    func fetchEmployee(completion: @escaping (Result<[Employee], Error>) -> Void)
}

