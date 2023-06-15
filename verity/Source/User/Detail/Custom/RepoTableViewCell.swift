//
//  RepoTableViewCell.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    //MARK: - Variable
    static let reuseIdentifier = "RepoTableViewCell"
    
    //MARK: - UI
    fileprivate let viewCard: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let labelDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 3
        return label
    }()
    
    fileprivate let viewLanguage: UIView = {
        let view = UIView()
        view.backgroundColor = .random()
        view.layer.cornerRadius = 10
        return view
    }()
    
    fileprivate let labelLanguage: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let stackViewLanguage: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let labelChip: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.textColor = .darkGray
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.layer.cornerRadius = 8
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let stackViewTop: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Function
    fileprivate func setupCell() {
        layer.cornerRadius = 1
        layer.borderColor = CGColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    fileprivate func setupUI() {
        stackViewTop.addArrangedSubview(labelName)
        stackViewTop.addArrangedSubview(UIView())
        stackViewTop.addArrangedSubview(labelChip)
        stackViewLanguage.addArrangedSubview(viewLanguage)
        stackViewLanguage.addArrangedSubview(labelLanguage)
        stackView.addArrangedSubview(stackViewTop)
        stackView.addArrangedSubview(labelDescription)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(stackViewLanguage)
        contentView.addSubview(viewCard)
        viewCard.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            viewCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            viewCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            viewLanguage.widthAnchor.constraint(equalToConstant: 20),
            viewLanguage.heightAnchor.constraint(equalToConstant: 20),
            
            stackView.topAnchor.constraint(equalTo: viewCard.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: viewCard.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: viewCard.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: viewCard.bottomAnchor, constant: -8)
        ])
    }
    
    func setupData(repo: Repo) {
        labelName.text = repo.name
        labelDescription.text = repo.description
        labelChip.text = " \(repo.visibility ?? "") "
        labelLanguage.text = repo.language
    }
}

