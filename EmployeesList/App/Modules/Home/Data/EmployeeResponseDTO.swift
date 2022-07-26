//
//  EmployeeResponseDTO.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

struct EmployeeResponseDTO: Decodable {
    let employees: [Employee]
}

extension EmployeeResponseDTO {
    func toDomain() -> [Employee] {
        return employees
    }
}
