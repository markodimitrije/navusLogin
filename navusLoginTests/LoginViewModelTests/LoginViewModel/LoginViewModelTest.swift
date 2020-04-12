//
//  LoginViewModelTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
import RxSwift
@testable import navusLogin

class LoginViewModelTest: XCTestCase {
    
    let userInputObs: Observable<ILoginCredentials> = Observable.just(EmptyUserInputMock())
    
    func testOutput_ShouldEmit_LoginValidationError_ForFailedValidation() {
        let testSubject = LoginViewModel(validator: RejectLoginValidatorMock(),
                                         loginRemoteApi: LoginRemoteApiErrorMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = testSubject.transform(input: input)
        do {
            _ = try output.processLogin.toBlocking().first()
        } catch {
            XCTAssertTrue(error is LoginValidationError)
        }
    }
    
    func testOutput_ShouldEmitTrue_ForSuccessValidation_AndThen_Error_ForFailLogin() {
        let testSubject = LoginViewModel(validator: AcceptLoginValidatorMock(),
                                         loginRemoteApi: LoginRemoteApiErrorMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = testSubject.transform(input: input)
        //assert 1
        let successValidation = try! output.processLogin.toBlocking().first()!
        XCTAssertTrue(successValidation)
        //assert 2
        do {
            let _ = try output.processLogin.toBlocking().last()!
        } catch {
            XCTAssertTrue(error is LoginError)
        }
    }
    
    func testOutput_ShouldEmit_True_And_Complete_ForSuccessValidation_AndSuccessLogin() throws {
        let testSubject = LoginViewModel(validator: AcceptLoginValidatorMock(),
                                         loginRemoteApi: LoginRemoteApiSuccessMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = testSubject.transform(input: input)
        // nextEvents (1 + 1): (successValidation + successRemoteLogin) [+completed]
        let nextEvents = try output.processLogin.toBlocking().toArray()
        XCTAssertTrue(nextEvents.count == 2)
    }
}
