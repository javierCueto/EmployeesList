//
//  LoadEmployeesUseCase.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

protocol LoadEmployeesUseCase {
    func execute(completion: @escaping (Result<EmployeResponse,Error>) -> Void)
}

struct LoadEmployeesUseCaseImpl: LoadEmployeesUseCase  {
    
    private var employeesRepository: EmployeesRepository
    
    init(employeesRepository: EmployeesRepository) {
        self.employeesRepository = employeesRepository
    }
    
    func execute(completion: @escaping (Result<EmployeResponse, Error>) -> Void) {
        employeesRepository.fetchEmployee(completion: completion)
    }
    
    
}
