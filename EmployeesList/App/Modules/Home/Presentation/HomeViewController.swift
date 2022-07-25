//
//  HomeViewController.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

final class HomeViewController: UICollectionViewController {
    
    // MARK: - Public properties
    private let viewModel: HomeViewModel
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    init(viewModel: HomeViewModel, layout: UICollectionViewFlowLayout) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
        binding()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Helpers
    private func configUI() {
        title = "Employees"
    }
    
    private func configCollectionView() {
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
    }
    
    private func binding() {
        viewModel.state.bind { result in
            switch result {
            case .success:
                print("success")
            case .loading:
                print("loading")
            case .failure(let message):
                print("failure")
            case .noData:
                print("noData")
            }
        }
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here

}

extension HomeViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
        else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    
}
