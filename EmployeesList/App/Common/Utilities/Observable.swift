//
//  Observable.swift
//  EmployeesList
//
//  Created by Javier Cueto on 25/07/22.
//

protocol Bindable {
    associatedtype BindableProtocol
    var value: BindableProtocol { get }
    mutating func bind(_ closure: @escaping (BindableProtocol) -> Void)
}

struct Observable<T>: Bindable {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    mutating func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
