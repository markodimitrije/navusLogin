//
//  LoginValidator.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

protocol ILoginValidator {
    func validate(userInput: ILoginCredentials) -> ValidInvalidEnum
}

struct LoginValidator {
    private let validators: [IFieldValidator]
    init(validators: [IFieldValidator]) {
        self.validators = validators
    }
}

extension LoginValidator: ILoginValidator {
    func validate(userInput: ILoginCredentials) -> ValidInvalidEnum {
        return .valid // TODO marko: implement me
    }
}

protocol IFieldValidator {
    func isValid(text: String) -> ValidInvalidEnum
}
