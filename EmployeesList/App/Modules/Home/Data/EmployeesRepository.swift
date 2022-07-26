//
//  EmployeesRepository.swift
//  EmployeesList
//
//  Created by Javier Cueto on 26/07/22.
//

protocol EmployeesRepository {
    func fetchEmployee(completion: @escaping (Result<EmployeResponse, Error>) -> Void)
}

struct EmployeesRepositoryImpl: EmployeesRepository {
    
    
    let apiClient: Requester
    
    func fetchEmployee(completion: @escaping (Result<EmployeResponse, Error>) -> Void ) {
        apiClient.request(type: EmployeResponse.self, completion: completion)
    }
    
    
}
