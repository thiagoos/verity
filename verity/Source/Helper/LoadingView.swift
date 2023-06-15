//
//  LoadingView.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class LoadingView: UIView {
    //MARK: UI
    fileprivate let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatiorView = UIActivityIndicatorView(style: .large)
        activityIndicatiorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatiorView
    }()
    
    fileprivate let viewCard: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate let labelLoading: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Aguarde..."
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
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
    private func setupUI() {
        backgroundColor = .init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        
        addSubview(viewCard)
        stackView.addArrangedSubview(activityIndicatorView)
        stackView.addArrangedSubview(labelLoading)
        viewCard.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            viewCard.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewCard.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: viewCard.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: viewCard.centerYAnchor),
            
            viewCard.widthAnchor.constraint(equalToConstant: 140),
            viewCard.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func startLoading(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        view.isUserInteractionEnabled = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        isHidden = true

        DispatchQueue.main.async {
            self.activityIndicatorView.startAnimating()
            self.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
            self.isHidden = false
        }
    }
    
    func stopLoading(in view: UIView) {
        view.isUserInteractionEnabled = true
        DispatchQueue.main.async {
            self.activityIndicatorView.stopAnimating()
            self.layer.zPosition = 0
            self.isHidden = true
        }
    }
}

