//
//  EmailValidatorMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

class EmailRejectValidatorMock: IFieldValidator {
    func isValid(text: String) -> ValidationEnum {
        return .invalid(LoginValidationError.emailNotValid)
    }
}

class EmailAcceptValidatorMock: IFieldValidator {
    func isValid(text: String) -> ValidationEnum {
        return .valid
    }
}
