//
//  PasswordFieldValidationTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
@testable import navusLogin

class PasswordFieldValidationTest: XCTestCase {
    
    let testSubject = PassFieldValidator()
    
    func testValidation_ShouldThrowError_IfPasswordNotLongerThanSixChars() {
        let expectedErrDesc = LoginValidationError.passNotValid.localizedDescription
        let result = testSubject.isValid(text: "123")
        switch result {
        case .invalid(let err):
            XCTAssertEqual(expectedErrDesc, err.localizedDescription)
        default:
            XCTAssert(false)
        }
    }
    
    func testValidation_ShouldReturnValid_IfPasswordEqualOrLongerThanSixChars() {
        let result = testSubject.isValid(text: "123456")
        XCTAssertEqual(ValidationEnum.valid, result)
    }
}
