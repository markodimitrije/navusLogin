//
//  LoginWorkerTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 16/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
import RxSwift
@testable import navusLogin

class LoginWorkerTest: XCTestCase {

    let input: Observable<ILoginCredentials> = Observable.just(ValidUserInputMock())
    
    func testLoginWorker_ShouldSaveDataFor_SuccessfullLogin() {
        XCTAssertTrue(false)
//        let userStateRepo = UserStateMock()
//        let sut = LoginWorker(loginRemoteApi: LoginRemoteApiSuccessMock(), userState: userStateRepo)
//        //act
//        let _ = sut.loginWith(input: input)
//        //assert
//        XCTAssertTrue(userStateRepo.logInUserWasCalled)
    }
}

class UserStateMock: IUserStateRepository {
    var logInUserWasCalled = false
    var logoutWasCalled = false
    func login(user: IRemoteUserSession) {
        logInUserWasCalled = true
    }
    func logout() {
        logoutWasCalled = true
    }
}
