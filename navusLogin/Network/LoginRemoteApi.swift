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
    
    func login(loginCredentials: ILoginCredentials) -> Observable<IRemoteUserSession> {
        let remoteMock = RemoteUserSession(credentials: LoginCredentials(email: "",
                                                                         password: ""),
                                           token: "Bearer_123")
        return Observable.just(remoteMock).delay(RxTimeInterval.seconds(3), scheduler: MainScheduler.instance) //TODO marko
    }
}
