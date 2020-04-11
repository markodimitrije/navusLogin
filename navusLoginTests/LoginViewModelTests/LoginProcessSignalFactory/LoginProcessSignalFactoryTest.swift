//
//  LoginProcessSignalFactoryTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
import XCTest
import RxSwift
@testable import navusLogin

class UserInputMock: UserInputProtocol {
    var email = ""
    var password = ""
}

class LoginProcessSignalFactoryTest: XCTestCase {
    
    let userInputMock = UserInputMock()
    //let rejectValidator = RejectLoginValidatorMock()
    
    func testLoginProcessSignalFactory_ShouldCreate_ExpectedSignalFor_AcceptValidator() {
        //arrange
        let acceptValidator = AcceptLoginValidatorMock()
        var testSubject = LoginProcessSignalFactory(validator: acceptValidator)
        //act
        let signal = testSubject.map(userInput: userInputMock)
        //assert
        signal.toB
    }
}
