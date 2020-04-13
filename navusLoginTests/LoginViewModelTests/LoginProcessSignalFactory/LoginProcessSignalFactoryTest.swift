//
//  LoginProcessSignalFactoryTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking

@testable import navusLogin

class LoginProcessSignalFactoryTest: XCTestCase {
    
    let userInputMock = EmptyUserInputMock()
    
    func testLoginValidationSignal_ShouldEmit_OnCompleteFor_AcceptValidator() {
        //arrange
        let acceptValidator = AcceptLoginValidatorMock()
        let sut = LoginValidationSignalFactory(validator: acceptValidator)
        //act
        let signal = sut.map(userInput: userInputMock)
        //assert
        do {
            let _ = try signal.toBlocking().toArray()
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testLoginValidationSignal_ShouldEmit_ErrorFor_RejectValidator() {
        //arrange
        let rejectValidator = RejectLoginValidatorMock()
        let sut = LoginValidationSignalFactory(validator: rejectValidator)
        //act+assert
        do {
            let signal = sut.map(userInput: userInputMock)
            let _ = try signal.toBlocking().first()!
        } catch is LoginValidationError {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
