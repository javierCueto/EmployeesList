//
//  HomeCell.swift
//  EmployeesList
//
//  Created by Javier Cueto on 25/07/22.
//

import UIKit

final class HomeCell: UICollectionViewCell {
    
    static let identifier = "HomeCell"

    
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    var viewModel: EmployeesViewModel? {
        didSet {
            configureData()
        }
    }
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Helpers
    private func configureData() {
        
    }
    // MARK: - Actions
    
    // MARK: - Extension here

}
