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
        let sut = LoginViewModel(validator: RejectLoginValidatorMock(),
                                 loginRemoteApi: LoginRemoteApiErrorMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = sut.transform(input: input)
        do {
            _ = try output.loginSignal.toBlocking().first()
        } catch {
            XCTAssertTrue(error is LoginValidationError)
        }
    }
    
    //func testOutput_ShouldEmitTrue_ForSuccessValidation_AndThen_Error_ForFailLogin() HOW?
        
    func testOutput_ShouldEmitTrue_ForSuccessValidation_AndThen_Error_ForFailLogin() {
        
        let sut = LoginViewModel(validator: AcceptLoginValidatorMock(),
                                 loginRemoteApi: LoginRemoteApiErrorMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = sut.transform(input: input)
        //assert
        do {
            let _ = try output.loginSignal.toBlocking().toArray() // onCompleted
            XCTAssertTrue(false)
        } catch {
            XCTAssertTrue(error is LoginError)
        }
    }
    
    func testOutput_ShouldEmit_True_And_Complete_ForSuccessValidation_AndSuccessLogin() throws {
        let sut = LoginViewModel(validator: AcceptLoginValidatorMock(),
                                 loginRemoteApi: LoginRemoteApiSuccessMock())
        let input = LoginViewModel.Input(userCredentials: userInputObs)
        let output = sut.transform(input: input)
        let events = try output.loginSignal.toBlocking().toArray()
        XCTAssertEqual(1, events.count)
        XCTAssertTrue(true) // both previous were completed
    }
}
