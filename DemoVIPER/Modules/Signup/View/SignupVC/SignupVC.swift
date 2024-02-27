//
//  SignupVC.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import UIKit

class SignupVC: UIViewController {

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
extension SignupVC {
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
extension SignupVC: PresenterToViewProtocol {
    func showSuccess<T: AnyObject>(array: Array<T>) {
        
    }
    
    func showError() {
        
    }
}

