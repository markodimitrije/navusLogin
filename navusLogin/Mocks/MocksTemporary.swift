//
//  MocksTemporary.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 16/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

class RemoteUserSessionMock: IRemoteUserSession {
    
    func getCredentials() -> ILoginCredentials {
        return LoginCredentials(email: "email", password: "password")
    }
    
    func getToken() -> String {
        return "token"
    }
    
}
