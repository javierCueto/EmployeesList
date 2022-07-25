//
//  HomeViewModel.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

protocol HomeViewModel {
    func viewDidLoad()
}

class Observable<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}


class HomeViewModelImpl: HomeViewModel{
    
    var state: Observable<Result<EmployeResponse, Error>?> = Observable(nil)
    
    func viewDidLoad() {
        ApiClient().request(type: EmployeResponse.self) { result in
            self.state.value = result
        }
    }
    
    
}
