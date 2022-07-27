//
//  ProfileViewController.swift
//  EmployeesList
//
//  Created by Javier Cueto on 27/07/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Public properties
    private let viewModel: ProfileViewModelImpl
    
    // MARK: - Private properties
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.width(size: 200)
        imageView.height(size: 200)
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 200 / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "👤 Misael Level 7"
        label.textAlignment = .center
        return label
    }()
    
    private let biographyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "🧰 Engineering"
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "📱 123 3465 2343"
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "pedro@picapiedra.com"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelContainerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, biographyLabel, emailLabel, teamLabel, numberLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillProportionally
        return stack
    }()
    
    
    // MARK: - Life Cycle
    
    init(viewModel: ProfileViewModelImpl) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Profile"
        view.addSubview(profileImage)
        profileImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, pTop: 15)
        profileImage.centerX()
        view.addSubview(labelContainerStackView)
        labelContainerStackView.anchor(top: profileImage.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, pTop: 15, pRight: 15, pLeft: 15)
        configData()
    }
    
    // MARK: - Helpers
    
    private func configData() {
        nameLabel.text = viewModel.name
        numberLabel.text = viewModel.phone
        teamLabel.text = viewModel.team
        emailLabel.text = viewModel.email
        biographyLabel.text = viewModel.biography
        profileImage.setImageFromNetwork(withURL: viewModel.image)
    }
    
    // MARK: - Actions
    
    // MARK: - Extension here

}
