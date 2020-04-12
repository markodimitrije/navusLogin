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
        return loginVC
    }
}

class LoginViewModelFactory {
    static func make() -> ILoginViewModel {
        let validator = LoginValidator(validators: [EmailFieldValidator(), PassFieldValidator()])
        let remoteApi = LoginRemoteApiFactory.make()
        return LoginViewModel(validator: validator, loginRemoteApi: remoteApi)
    }
}

class EmailFieldValidator: IFieldValidator {
    func isValid(text: String) -> ValidInvalidEnum {
        return ValidInvalidEnum.valid // TODO marko implement me
    }
}

class PassFieldValidator: IFieldValidator {
    func isValid(text: String) -> ValidInvalidEnum {
        return ValidInvalidEnum.valid // TODO marko implement me
    }
}
