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
    var viewModel: EmployeesViewModel? {
        didSet {
            configureData()
        }
    }
    
    // MARK: - Private properties
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "profile")
        imageView.width(size: 70)
        imageView.layer.cornerRadius = 70 / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "👤 Misael Level 7"
        return label
    }()
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "🧰 Engineering"
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "📱 123 3465 2343"
        return label
    }()
    
    private lazy var labelContainerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, teamLabel, numberLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        backgroundColor = .systemGray5.withAlphaComponent(0.1)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    
    // MARK: - Helpers
    
    private func configUI() {
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, pTop: 15, pBottom: 15, pLeft: 20)
        addSubview(labelContainerStackView)
        labelContainerStackView.anchor(top: topAnchor, right: rightAnchor, bottom: bottomAnchor, left: profileImage.rightAnchor, pTop: 15, pRight: 15, pBottom: 15, pLeft: 15)
    }
    
    private func configureData() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        numberLabel.text = viewModel.phone
        teamLabel.text = viewModel.team
        profileImage.setImageFromNetwork(withURL: viewModel.image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImage.image = nil
    }
    // MARK: - Actions
    
    // MARK: - Extension here
    
}
