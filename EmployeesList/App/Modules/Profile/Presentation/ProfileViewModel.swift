//
//  ProfileViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 27/07/22.
//

import Foundation

final class ProfileViewModelImpl {
    private var employe: Employee
    init(employee: Employee) {
        self.employe = employee
    }
    
    var name: String {
        "👤 \(employe.fullName)"
    }
    
    var team: String {
        "🧰 \(employe.team)"
    }
    
    var phone: String {
        "📱 \(employe.phoneNumber ?? "000 000 000")"
    }
    
    var biography: String {
        employe.biography ?? ""
    }
    
    var email: String {
        employe.emailAddress
    }
    
    var image: URL? {
        return URL(string: employe.photoUrlSmall ?? "")
    }
}
