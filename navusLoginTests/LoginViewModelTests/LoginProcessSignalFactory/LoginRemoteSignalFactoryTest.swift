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
    
    func testLoginRemoteSignalFactory_ShouldEmitCompleted_ForSuccessfullLogin() {
        //arrange
        let mockSuccessApi = LoginRemoteApiSuccessMock()
        let credentials = Observable.just(ValidUserInputMock() as ILoginCredentials)
        let sut = LoginRemoteSignalFactory(loginRemoteApi: mockSuccessApi)
        //act
        let signal = sut.createWith(sig: credentials)
        //assert
        do {
            let _ = try signal.toBlocking().toArray() // onCompleted
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
        
    }
    
    func testLoginRemoteSignalFactory_ShouldEmitError_ForErrorLogin() {
        //arrange
        let mockErrorApi = LoginRemoteApiErrorMock()
        let credentials = Observable.just(EmptyUserInputMock() as ILoginCredentials)
        let sut = LoginRemoteSignalFactory(loginRemoteApi: mockErrorApi)
        //act
        let signal = sut.createWith(sig: credentials)
        //assert
        do {
            let _ = try signal.toBlocking().first()
        } catch {
            XCTAssertTrue(error is LoginError)
        }
        
    }
}

