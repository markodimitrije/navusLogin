//
//  LoginRemoteApi.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

class LoginRemoteApi: ILoginRemoteApi {
    private let apiController: Bool
    init(apiController: Bool) {
        self.apiController = apiController
    }
    
    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        let transSig = sig.map(RemoteUserSessionFactory.make)
        return transSig.delay(2.0, scheduler: MainScheduler.instance)
    }
}

class RemoteUserSessionFactory {
    static func make(credentials: ILoginCredentials) -> IRemoteUserSession {
        return RemoteUserSession(credentials: credentials, token: "new_token")
    }
}
