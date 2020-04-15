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
                                           token: "token")
        return Observable.just(remoteMock).delay(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance) //TODO marko
    }
    
    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        let transSig = sig.map { (credentials) -> IRemoteUserSession in
            return RemoteUserSession(credentials: LoginCredentials(email: "", password: ""),
                                     token: "token")
        }
        //return Observable.just(remoteMock).delay(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance) //TODO marko
        return transSig.delay(2.0, scheduler: MainScheduler.instance)
    }
}
