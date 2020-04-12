//
//  LoginRemoteSignalFactoryTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
import RxSwift
@testable import navusLogin

class LoginRemoteSignalFactoryTest: XCTestCase {
    
    func testLoginRemoteSignalFactory_ShouldEmitTrue_ForSuccessfullLogin() {
        //arrange
        let mockSuccessApi = LoginRemoteApiSuccessMock()
        let testSubject = LoginRemoteSignalFactory(loginRemoteApi: mockSuccessApi)
        //act
        let signal = testSubject.map(userInput: EmptyUserInputMock())
        //assert
        let event = try! signal.toBlocking().first()!
        XCTAssertEqual(true, event)
    }
    
    func testLoginRemoteSignalFactory_ShouldEmitError_ForErrorLogin() {
        //arrange
        let mockErrorApi = LoginRemoteApiErrorMock()
        let testSubject = LoginRemoteSignalFactory(loginRemoteApi: mockErrorApi)
        //act
        let signal = testSubject.map(userInput: EmptyUserInputMock())
        //assert
        do {
            let _ = try signal.toBlocking().first()!
        } catch {
            XCTAssertTrue(error is LoginError)
        }
        
    }
}

