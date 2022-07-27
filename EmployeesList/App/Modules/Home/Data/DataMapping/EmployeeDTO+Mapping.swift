//
//  EmployeeDTO.swift
//  EmployeesList
//
//  Created by Javier Cueto on 27/07/22.
//

struct EmployeeDTO: Decodable {
    let uuid: String
    let fullName: String
    let phoneNumber: String?
    let emailAddress: String
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String
    let employeeType: String
}

extension EmployeeDTO {
    func toDomain() -> Employee {
        return .init(
            uuid: uuid,
            fullName: fullName,
            phoneNumber: phoneNumber,
            emailAddress: emailAddress,
            biography: biography,
            photoUrlSmall: photoUrlSmall,
            photoUrlLarge: photoUrlLarge,
            team: team,
            employeeType: employeeType)
    }
}
