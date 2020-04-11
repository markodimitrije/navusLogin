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
    
    func testLoginProcessSignalFactory_ShouldCreate_ExpectedSignalFor_AcceptValidator() {
        //arrange
        let acceptValidator = AcceptLoginValidatorMock()
        let testSubject = LoginValidationSignalFactory(validator: acceptValidator)
        //act
        let signal = testSubject.map(userInput: userInputMock)
        //assert
        let trueEvent = try! signal.toBlocking().toArray().first!
        XCTAssertTrue(trueEvent)
    }
    
    func testLoginProcessSignalFactory_ShouldCreate_ExpectedSignalFor_RejectValidator() {
        //arrange
        let rejectValidator = RejectLoginValidatorMock()
        let testSubject = LoginValidationSignalFactory(validator: rejectValidator)
        //act+assert
        do {
            let signal = testSubject.map(userInput: userInputMock)
            let _ = try signal.toBlocking().first()!
        } catch is LoginValidationError {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
