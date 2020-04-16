//
//  RejectLoginValidatorMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

//class RejectLoginValidatorMock: ILoginValidator {
//    func validate(userInput: ILoginCredentials) -> ValidationEnum {
//        return .invalid(LoginValidationError.fieldIsEmpty)
//    }
//}

class RejectLoginValidatorMock: ILoginValidator {
    func validate(userInput: ILoginCredentials) -> ValidationEnum {
        do {
            _ = try invalidate()
        } catch {
            return .invalid(LoginValidationError.fieldIsEmpty)
        }
        return .invalid(LoginValidationError.fieldIsEmpty)
    }
    
    private func invalidate() throws -> ValidationEnum {
        throw LoginValidationError.fieldIsEmpty
    }
}
