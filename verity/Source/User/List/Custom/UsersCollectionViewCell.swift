//
//  UsersCollectionViewCell.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    //MARK: - Variable
    static let reuseIdentifier = "UsersCollectionViewCell"
    
    //MARK: - UI
    fileprivate let viewCard: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .init(width: 5, height: 5)
        view.layer.shadowRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let imageViewProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 45
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    fileprivate let labelLogin: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    fileprivate func setupUI() {
        contentView.addSubview(viewCard)
        stackView.addArrangedSubview(imageViewProfile)
        stackView.addArrangedSubview(labelLogin)
        viewCard.addSubview(stackView)

        NSLayoutConstraint.activate([
            viewCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            viewCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            viewCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            viewCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            stackView.centerYAnchor.constraint(equalTo: viewCard.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: -16),
            imageViewProfile.widthAnchor.constraint(equalToConstant: 90),
            imageViewProfile.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func setupData(user: User) {
        if let urlString = user.avatar_url, let url = URL(string: urlString) {
            self.imageViewProfile.load(url: url, placeholder: UIImage())
        }
        self.labelLogin.text = user.login
    }
}

