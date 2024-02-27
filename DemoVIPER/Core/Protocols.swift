//
//  Protocols.swift
//  DemoVIPER
//
//  Created by Akash Pandey on 26/01/2024.
//

import UIKit

//MARK: - ViewToPresenterProtocol
protocol ViewToPresenterProtocol: AnyObject{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    
    /// Tells interactor to start fetching data
    func startFetching()
    
    /// Calls when the module is Prepared to tell router to push this screen into the stack
    /// - Parameter navigationController: UINavigationController
    func showController(navigationController:UINavigationController)
}

//MARK: - PresenterToViewProtocol
protocol PresenterToViewProtocol: AnyObject{
    
    /// Tells view To show success by the array data
    /// - Parameter array: Array<GenericType>
    func showSuccess<T:AnyObject>(array:Array<T>)
    
    /// Tells view To show error to the user
    func showError()
}

//MARK: - InteractorToPresenterProtocol
protocol InteractorToPresenterProtocol: AnyObject {
    
    /// Calls when the API successfully fetches data
    /// - Parameter modelArray: Array<GenericType>
    func fetchSuccess<T:AnyObject>(modelArray:Array<T>)
    
    /// Calls when the API data fetch fails
    func fetchFailed()
}

//MARK: - PresenterToInteractorProtocol
protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    
    /// Fetches data for the particular screen from where the method is called
    func fetch()
}

//MARK: - PresenterToRouterProtocol
protocol PresenterToRouterProtocol: AnyObject {
    
    /// Creates the module of the class for which the method is called
    /// - Returns: UIViewController
    static func createModule()-> UIViewController
    
    /// Pushes to particular screen in the NavigationController given in the parameter
    /// - Parameters:
    ///   - screen: ScreenType enum
    ///   - navigationConroller: UINavigationController
    func pushToScreen(screen: Screen,navigationConroller:UINavigationController)
}

//MARK: - pushToScreen(:_,:_)
extension PresenterToRouterProtocol {
    
    func pushToScreen(screen: Screen, navigationConroller: UINavigationController) {
        let module: UIViewController
        switch screen {
            
        case .login:
            module = LoginVC()
        case .signup:
            module = SignupVC()
        case .endPoint:
            module = UIViewController()
        }
        navigationConroller.pushViewController(module, animated: true)
    }
}

//MARK: - Screens enum
enum Screen {
    case login
    case signup
    case endPoint
}
