//
//  EmployeesRepository.swift
//  EmployeesList
//
//  Created by Javier Cueto on 26/07/22.
//


struct EmployeesRepositoryImpl: EmployeesRepository {
    
    
    let apiClient: Requester
    
    func fetchEmployee(completion: @escaping (Result<[Employee], Error>) -> Void ) {
        apiClient.request(type: EmployeeResponseDTO.self) { result in
            switch result {
                
            case .success(let employeeResponseDTO):
                completion(.success(employeeResponseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
