//
//  HomeViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

protocol HomeViewModel {
    var state: Observable<HomeState> { get set }
    var employeesItem: [EmployeesViewModel] { get }
    func viewDidLoad()
}

final class HomeViewModelImpl: HomeViewModel{
    
    private let loadEmployeesUseCase: LoadEmployeesUseCase
    var state: Observable<HomeState> = .init(.loading)
    var employeesItem: [EmployeesViewModel] = []
    
    init(loadEmployeesUseCase: LoadEmployeesUseCase) {
        self.loadEmployeesUseCase = loadEmployeesUseCase
    }
    
    func viewDidLoad() {
        loadEmployeesUseCase.execute { result in
            switch result {
            case .success(let data):
                self.employeesItem = data.map { EmployeesViewModel(employe: $0) }
                self.state.value = .success
            case .failure(let error):
                self.state.value = .failure(message: error.localizedDescription)
            }
  
        }
    }
    
    
}
