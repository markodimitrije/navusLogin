//
//  PasswordValidatorMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

class PassRejectValidatorMock: IFieldValidator {
    func isValid(text: String) -> ValidationEnum {
        return .invalid(LoginValidationError.passNotValid)
    }
}

class PassAcceptValidatorMock: IFieldValidator {
    func isValid(text: String) -> ValidationEnum {
        return .valid
    }
}
