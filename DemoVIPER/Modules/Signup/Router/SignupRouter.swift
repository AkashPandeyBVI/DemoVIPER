//
//  SignupRouter.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import UIKit

class SignupRouter: PresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = SignupVC()
        let interactor = SignupInteractor()
        let presenter = SignupPresenter()
        let router = SignupRouter()
        
        // Combining
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
}
