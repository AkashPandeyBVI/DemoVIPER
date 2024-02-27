//
//  LoginRouter.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = LoginVC()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = LoginPresenter()
        let interactor: PresenterToInteractorProtocol = LoginInteractor()
        let router: PresenterToRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
