//
//  EmployeeResponseDTO.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

struct EmployeeResponseDTO: Decodable {
    let employees: [EmployeeDTO]
}

extension EmployeeResponseDTO {
    func toDomain() -> [Employee] {
        return employees.map { $0.toDomain() }
    }
}
