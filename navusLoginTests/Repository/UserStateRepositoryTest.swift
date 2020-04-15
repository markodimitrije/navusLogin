//
//  UserStateRepositoryTest.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 15/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import XCTest
@testable import navusLogin

class UserStateRepositoryTest: XCTestCase {
    
    var userDefaults: UserDefaults!
    var sut: IUserStateRepository!
    
    override func setUp() {
        super.setUp()
        self.userDefaults = UserDefaults(suiteName: self.name)
        sut = UserStateRepository(userDefaults: userDefaults)
    }
    
    override func tearDown() {
        self.userDefaults.removePersistentDomain(forName: self.name)
        super.tearDown()
    }
    
    func testLoginFunc_ShouldSaveUserSession_ToUserDefaults() {
        let userSession = RemoteUserSessionMock()
        sut.login(user: userSession)
        //XCTAssert
        XCTAssertEqual(userSession.getCredentials().email,
                       userDefaults.value(forKey: "email") as? String)
        XCTAssertEqual(userSession.getCredentials().password,
                       userDefaults.value(forKey: "password") as? String)
        XCTAssertEqual(userSession.getToken(),
                       userDefaults.value(forKey: "token") as? String)
    }
    
    func testLogoutFunc_ShouldSetExpectedFieldsToNil_InUserDefaults() {
        //arrange
        userDefaults.setValue("email", forKey: "email")
        userDefaults.setValue("password", forKey: "password")
        userDefaults.setValue("token", forKey: "token")
        //act
        sut.logout()
        //XCTAssert
        XCTAssertNil(userDefaults.value(forKey: "email"))
        XCTAssertNil(userDefaults.value(forKey: "password"))
        XCTAssertNil(userDefaults.value(forKey: "token"))
    }
}
