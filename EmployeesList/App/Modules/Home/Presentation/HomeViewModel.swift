//
//  HomeViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

protocol HomeViewModel {
    var state: Observable<State> { get }
    func viewDidLoad()
}

enum State {
    case success
    case loading
    case failure(message: String)
    case noData
}




class HomeViewModelImpl: HomeViewModel{
    
    var state: Observable<State> = .init(.loading)
    var employees: [EmployeesViewModel] = []
    
    func viewDidLoad() {
        ApiClient().request(type: EmployeResponse.self) { result in
            
            switch result {
                
            case .success(let data):
                self.state.value = .success
                self.employees = data.employees.map { EmployeesViewModel(employe: $0) }
            case .failure(let error):
                self.state.value = .failure(message: error.localizedDescription)
            }
  
        }
    }
    
    
}