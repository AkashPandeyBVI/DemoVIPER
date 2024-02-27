//
//  LoginPresenter.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetching() {
        interactor?.fetch()
    }
    
    func showController(navigationController: UINavigationController) {
        router?.pushToScreen(screen: .login, navigationConroller: navigationController)
    }
}

extension LoginPresenter: InteractorToPresenterProtocol {
    func fetchSuccess<T>(modelArray: Array<T>) where T : AnyObject {
        view?.showSuccess(array: modelArray)
    }
    
    func fetchFailed() {
        view?.showError()
    }
}
