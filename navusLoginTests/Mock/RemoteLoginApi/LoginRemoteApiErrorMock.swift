//
//  LoginRemoteApiErrorMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift
@testable import navusLogin

class LoginRemoteApiErrorMock: ILoginRemoteApi {
    func login(loginCredentials: ILoginCredentials) -> Observable<IRemoteUserSession> {
        Observable.create { (observer) -> Disposable in
            observer.onError(LoginError.unknownUser)
            return Disposables.create()
        }
    }
}
