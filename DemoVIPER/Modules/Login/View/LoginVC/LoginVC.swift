//
//  LoginVC.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 05/01/24.
//

import UIKit

class LoginVC: UIViewController {
    
    // @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDelegates()
        registerNibs()
    }
}

//MARK: - Private
extension LoginVC {
    private func setupView() {
        
    }
    
    private func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerNibs() {
        
    }
}

//MARK: - PresenterToViewProtocol
extension LoginVC: PresenterToViewProtocol {
    func showSuccess<T: AnyObject>(array: Array<T>) {
        
    }
    
    func showError() {
        
    }
}
