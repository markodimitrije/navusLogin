//
//  LoginValidationTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
@testable import navusLogin

class LoginValidationTest: XCTestCase {
    
    let userInput = LoginCredentials(email: "john", password: "123456")
    let emailRejectValidator = EmailRejectValidatorMock()
    let emailAcceptValidator = EmailAcceptValidatorMock()
    
    let passAcceptValidator = PassAcceptValidatorMock()
    let passRejectValidator = PassRejectValidatorMock()
    
    func testLoginValidation_ShouldThrowError_ForInvalidEmail() {
        //arrange
        let userInput = InvalidPassUserInputMock()
        let testSubject = LoginValidator(validators: ["email": emailRejectValidator,
                                                      "password": passAcceptValidator])
        //act
        let result = testSubject.validate(userInput: userInput)
        let expectedErrDesc = LoginValidationError.emailNotValid.localizedDescription
        //assert
        switch result {
        case .invalid(let err):
            XCTAssertEqual(expectedErrDesc, err.localizedDescription)
        default: XCTAssert(false)
        }
    }
    
    func testLoginValidation_ShouldThrowError_ForInvalidPass() {
        //arrange
        let testSubject = LoginValidator(validators: ["email": emailAcceptValidator,
                                                      "password": passRejectValidator])
        //act
        let result = testSubject.validate(userInput: userInput)
        let expectedErrDesc = LoginValidationError.passNotValid.localizedDescription
        //assert
        switch result {
        case .invalid(let err):
            XCTAssertEqual(expectedErrDesc, err.localizedDescription)
        default: XCTAssert(false)
        }
    }
    
    func testLoginValidation_ShouldSucceed_ForValid_EmailAndPassword() {
        //arrange
        let testSubject = LoginValidator(validators: ["email": emailAcceptValidator,
                                                      "password": passAcceptValidator])
        //act
        let result = testSubject.validate(userInput: userInput)
        //assert
        XCTAssertEqual(ValidationEnum.valid, result)
    }
}
