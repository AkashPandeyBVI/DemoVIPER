//
//  SignupPresenter.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 08/01/24.
//

import Foundation
import UIKit

class SignupPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetching() {
        interactor?.fetch()
    }
    
    func showController(navigationController: UINavigationController) {
        router?.pushToScreen(screen: .signup, navigationConroller: navigationController)
    }
}

extension SignupPresenter: InteractorToPresenterProtocol {
    func fetchSuccess<T>(modelArray: Array<T>) where T : AnyObject {
        view?.showSuccess(array: modelArray)
    }
    
    func fetchFailed() {
        view?.showError()
    }
}
