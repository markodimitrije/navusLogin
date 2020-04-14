//
//  LoginViewControllerFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LoginViewControllerFactory {
    static func make() -> LoginViewController {
        let loginSb = UIStoryboard.init(name: "LoginViewController", bundle: nil)
        let loginVC = LoginViewController.instantiate(using: loginSb)
        loginVC.viewModel = LoginViewModelFactory.make()
        loginVC.alertErrPresenter = AlertErrorPresenter()
        loginVC.keyboardListener = KeyboardListener()
        return loginVC
    }
}

class LoginViewModelFactory {
    static func make() -> LoginViewModel {
        return LoginViewModel(validator: LoginValidatorFactory.make(),
                              loginRemoteApi: LoginRemoteApiFactory.make())
    }
}
