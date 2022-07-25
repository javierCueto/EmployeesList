//
//  EmployeesViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 25/07/22.
//

struct EmployeesViewModel {
    let employe: Employee
    
    var name: String {
        "👤 \(employe.fullName)"
    }
    
    var team: String {
        "🧰 \(employe.fullName)"
    }
    
    var phone: String {
        "📱 \(employe.fullName)"
    }
}
