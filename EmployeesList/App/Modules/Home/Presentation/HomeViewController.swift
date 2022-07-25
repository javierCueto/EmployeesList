//
//  HomeViewController.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    // MARK: - Public properties
    private var viewModel = HomeViewModelImpl()
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        viewModel.viewDidLoad()
        binding()
    }
    
    // MARK: - Helpers
    private func configUI() {
        collectionView.backgroundColor = .blue
    }
    
    private func binding() {
        viewModel.state.bind { result in
            guard let result = result else { return }
            switch result {
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here

}
