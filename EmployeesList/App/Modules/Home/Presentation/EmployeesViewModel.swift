//
//  EmployeesViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 25/07/22.
//

import Foundation

struct EmployeesViewModel {
    let employe: Employee
    
    var name: String {
        "👤 \(employe.fullName)"
    }
    
    var team: String {
        "🧰 \(employe.team)"
    }
    
    var phone: String {
        "📱 \(employe.phoneNumber ?? "000 000 000")"
    }
    
    var image: URL? {
        return URL(string: employe.photoUrlSmall ?? "")
    }
}
