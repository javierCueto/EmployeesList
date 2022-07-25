//
//  HomeViewController.swift
//  EmployeesList
//
//  Created by Javier Cueto on 24/07/22.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Helpers
    private func configUI() {
        collectionView.backgroundColor = .blue
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here

}
