//
//  ErrorView.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class CustomErrorView: UIView {
    //MARK: - Variable
    var actionButtonTapped: (() -> Void)?
    
    // MARK: - UI
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "error")
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    @objc private func retryButtonTapped() {
        actionButtonTapped?()
    }
    private func setupViews() {
        backgroundColor = .white
        
        layer.cornerRadius = 16
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .init(width: 5, height: 5)
        layer.shadowRadius = 8
        
        addSubview(imageView)
        addSubview(labelTitle)
        addSubview(labelDescription)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            
            labelTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20),
            labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func configure(in view: UIView, title: String, description: String, actionTitle: String) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: view.centerXAnchor),
            widthAnchor.constraint(equalToConstant: view.frame.width * 0.7),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
        
        labelTitle.text = title
        labelDescription.text = description
        button.setTitle(actionTitle, for: .normal)
    }
    
    func hide() {
        removeFromSuperview()
    }
}

