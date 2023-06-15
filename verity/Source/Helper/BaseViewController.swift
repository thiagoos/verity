//
//  BaseViewController.swift
//  verity
//
//  Created by Thiago Soares on 09/06/23.
//

import UIKit

class BaseViewController: UIViewController {
    //MARK: - UI
    let loadingView = LoadingView()
    let errorView = CustomErrorView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

