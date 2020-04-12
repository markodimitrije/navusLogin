//
//  RemoteUserSession.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

extension RemoteUserSession: IRemoteUserSession {
    func getCredentials() -> ILoginCredentials { self.credentials }
    func getToken() -> String { self.token }
}

struct RemoteUserSession {
    
    // MARK: - Properties
    private let credentials: LoginCredentials
    private let token: String
    
    init(credentials: LoginCredentials, token: String) {
        self.credentials = credentials
        self.token = token
    }

}

extension RemoteUserSession: Equatable {
    
    public static func ==(lhs: RemoteUserSession, rhs: RemoteUserSession) -> Bool {
        return lhs.token == rhs.token
    }
}
