//
//  EmailFieldValidatorTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
@testable import navusLogin

class EmailFieldValidatorTest: XCTestCase {
    
    let testSubject = EmailFieldValidator()
    
    func testValidate_ShouldReturnValid_ForValidEmail() {
        let result = testSubject.isValid(text: "john.doe@gmail.com")
        XCTAssertEqual(ValidationEnum.valid, result)
    }
    
    func testValidate_ShouldReturnExceptedError_ForInvalidEmail() {
        let expectedErrDesc = LoginValidationError.emailNotValid.localizedDescription
        let result = testSubject.isValid(text: "john.doe")
        switch result {
        case .invalid(let err):
            XCTAssertEqual(expectedErrDesc, err.localizedDescription)
        default:
            XCTAssert(false)
        }
        
    }
}
