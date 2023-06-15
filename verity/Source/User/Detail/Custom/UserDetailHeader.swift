//
//  UserDetailHeader.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class UserDetailHeader: UIView {
    //MARK: - UI
    private let imageViewProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 130
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    fileprivate let labelName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let labelLogin: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
   
    fileprivate let cardCompany: UserDetailCardInformation = {
        let view = UserDetailCardInformation()
        view.imageString = UIImage(named: "company")
        return view
    }()
    
    fileprivate let cardFollowers: UserDetailCardInformation = {
        let view = UserDetailCardInformation()
        view.imageString = UIImage(named: "people")
        return view
    }()
    
    fileprivate let cardLocation: UserDetailCardInformation = {
        let view = UserDetailCardInformation()
        view.imageString = UIImage(named: "location")
        return view
    }()
    
    fileprivate let cardBlog: UserDetailCardInformation = {
        let view = UserDetailCardInformation()
        view.imageString = UIImage(named: "blog")
        return view
    }()
    
    fileprivate let cardTwitter: UserDetailCardInformation = {
        let view = UserDetailCardInformation()
        view.imageString = UIImage(named: "twitter")
        return view
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let stackViewImage: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let stackViewLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let stackViewCards: UIStackView = {
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
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Function
    fileprivate func setupUI() {
        stackViewImage.addArrangedSubview(imageViewProfile)
        stackView.addArrangedSubview(stackViewImage)
        stackViewLabels.addArrangedSubview(labelName)
        stackViewLabels.addArrangedSubview(labelLogin)
        stackView.addArrangedSubview(stackViewLabels)
        stackView.addArrangedSubview(cardFollowers)
        stackView.addArrangedSubview(cardCompany)
        stackView.addArrangedSubview(cardLocation)
        stackView.addArrangedSubview(cardBlog)
        stackView.addArrangedSubview(cardTwitter)

        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            imageViewProfile.widthAnchor.constraint(equalToConstant: 260),
            imageViewProfile.heightAnchor.constraint(equalToConstant: 260),
        ])
        
        self.cardCompany.isHidden = true
        self.cardLocation.isHidden = true
        self.cardBlog.isHidden = true
        self.cardTwitter.isHidden = true
    }
    
    func setupData(user: User) {
        if let urlString = user.avatar_url, let url = URL(string: urlString) {
            self.imageViewProfile.load(url: url, placeholder: UIImage())
        }
        self.labelName.text = user.name
        self.labelLogin.text = user.login
        
        if let twitter_username = user.twitter_username {
            self.cardTwitter.labelText = "@\(twitter_username)"
            self.cardTwitter.isHidden = false
        }
        
        self.cardFollowers.labelText = "\(user.followers ?? 0) seguidores"
        if let company = user.company {
            self.cardCompany.labelText = company
            self.cardCompany.isHidden = false
        }
        if let blog = user.blog, !blog.isEmpty {
            self.cardBlog.labelText = blog
            self.cardBlog.isHidden = false
        }
        if let location = user.location {
            self.cardLocation.labelText = location
            self.cardLocation.isHidden = false
        }
    }
}

