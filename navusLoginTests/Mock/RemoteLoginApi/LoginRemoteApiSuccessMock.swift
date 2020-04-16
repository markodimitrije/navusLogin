//
//  LoginRemoteApiSuccessMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift
@testable import navusLogin

class LoginRemoteApiSuccessMock: ILoginRemoteApi {
//    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
//        Observable.create { (observer) -> Disposable in
//            observer.onNext(RemoteUserSessionMock())
//            return Disposables.create()
//        }
//    }
    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        return sig.map {_ in RemoteUserSessionMock()}
    }
}
