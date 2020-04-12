//
//  RemoteUserSessionMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

class RemoteUserSessionMock: IRemoteUserSession {
    
    func getCredentials() -> ILoginCredentials {
        return LoginCredentials(email: "email", password: "password")
    }
    
    func getToken() -> String {
        return "Bearer_123456"
    }
    
}
