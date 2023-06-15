//
//  UserDetailCardInformation.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit


class UserDetailCardInformation: UIView {
    //MARK: - Variable
    var labelText: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    var imageString: UIImage? {
        get { imageView.image }
        set { imageView.image = newValue }
    }
    
    //MARK: - UI
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
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
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Function
    fileprivate func setupUI() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func setupData(iconString: String, title: String) {
        imageView.image = UIImage(named: iconString)
        label.text = title
    }
}

